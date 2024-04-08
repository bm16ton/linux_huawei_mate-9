#include "reboot-erecovery.h"
#include <linux/printk.h>
#include <asm/string.h>
#include <linux/printk.h>
#include <linux/syscalls.h>
#include <linux/kernel.h>
#include <asm/uaccess.h>
#include <asm/thread_info.h>
#include <linux/reboot.h>

#define BOOTLOADER_CMD_STR "boot-bootloader"
#define RECOVERY_CMD_STR "boot-recovery"
#define ERECOVERY_CMD_STR "boot-erecovery"
#define ERECOVERY_CLEAR_CMD_STR "               "
#define MISC_DEV_FIRST_PATH "/dev/sdd15"   									// Linux
#define MISC_DEV_SECOND_PATH "/dev/block/bootdevice/by-name/misc"   		// Android

typedef struct
{
    char command[32];
    char status[32];
    char recovery[1024];
} misc_bootmsg_type;


int read_ufs_part(const char *part_name, unsigned long long offset, char *buf, unsigned long long buf_size)
{
    int fd = -1;
    long long ret = -1;
    //char dev_path[256] = {0};
    mm_segment_t fs = 0;

    if (unlikely(NULL == part_name) || unlikely(NULL == buf))
    {
        printk("Invalid parameters!\n");
        return -1;
    }

    fs = get_fs();
    set_fs(KERNEL_DS);
    fd = sys_open(part_name, O_RDONLY, 0);
    if (fd < 0)
    {
        printk("Open file [%s] failed!\n", part_name);
        set_fs(fs);
        return -1;
    }

    ret = sys_lseek(fd, (off_t)offset, SEEK_SET);
    if ((off_t)offset != ret)
    {
        printk("lseek file [%s] offset: %ld failed![ret: %lld]\n", part_name, (off_t)offset, ret);
        sys_close(fd);
        set_fs(fs);
        return -1;
    }

    ret = sys_read(fd, buf, buf_size);
    if ((long long)buf_size != ret)
    {
        printk("read file [%s] failed!buf_size: %lld [%lld]\n", part_name, (long long)buf_size, ret);
        sys_close(fd);
        set_fs(fs);
        return -1;
    }

    sys_close(fd);
    set_fs(fs);

    return 0;
}


int write_ufs_part(const char *part_name, unsigned long long offset, char *buf, unsigned long long buf_size)
{
    int fd = -1;
    long long ret = -1;
    mm_segment_t fs = 0;

    if (unlikely(NULL == part_name) || unlikely(NULL == buf))
    {
        printk("Invalid parameters!\n");
        return -1;
    }

    fs = get_fs();
    set_fs(KERNEL_DS);
    fd = sys_open(part_name, O_WRONLY, 0);
    if (fd < 0)
    {
        printk("Open file [%s] failed!\n", part_name);
        set_fs(fs);
        return -1;
    }

    ret = sys_lseek(fd, (off_t)offset, SEEK_SET);
    if ((off_t)offset != ret)
    {
        printk("lseek file [%s] offset: %ld failed![ret: %lld]\n", part_name, (off_t)offset, ret);
        sys_close(fd);
        set_fs(fs);
        return -1;
    }

    ret = sys_write(fd, buf, buf_size);
    if ((long long)buf_size != ret)
    {
        printk("write file [%s] failed!buf_size: %lld [%lld]\n", part_name, (long long)buf_size, ret);
        sys_close(fd);
        set_fs(fs);
        return -1;
    }

    sys_fsync(fd);
    sys_close(fd);
    set_fs(fs);

    return 0;
}

int set_misc_msg_for_erecovery(void)
{
    int ret = -1;
    misc_bootmsg_type msg;

    memset((void *)&msg, 0, sizeof(msg));
    memcpy(msg.command, (void *)ERECOVERY_CMD_STR, strlen(ERECOVERY_CMD_STR));
    ret = write_ufs_part(MISC_DEV_FIRST_PATH, 0x0, (char *)&msg, sizeof(msg));
    if (0 != ret)
    {
        printk("Write misc [%s] failed!\nWrite mics [%s] now!\n",
            MISC_DEV_FIRST_PATH, MISC_DEV_SECOND_PATH);
        ret = write_ufs_part(MISC_DEV_SECOND_PATH, 0x0, (char *)&msg, sizeof(msg));
        if (0 != ret)
        {
            printk("Write misc [%s] failed!\n", MISC_DEV_SECOND_PATH);
        }
    }

	kernel_restart("erecovery");

    return ret;
}

int clear_misc_msg_for_erecovery(void) // aka boot android
{
    int ret = -1;
    misc_bootmsg_type msg;

    memset((void *)&msg, 0, sizeof(msg));
    memcpy(msg.command, (void *)ERECOVERY_CLEAR_CMD_STR, strlen(ERECOVERY_CLEAR_CMD_STR));
    ret = write_ufs_part(MISC_DEV_FIRST_PATH, 0x0, (char *)&msg, sizeof(msg));
    if (0 != ret)
    {
        printk("Write misc [%s] failed!\nWrite mics [%s] now!\n",
            MISC_DEV_FIRST_PATH, MISC_DEV_SECOND_PATH);
        ret = write_ufs_part(MISC_DEV_SECOND_PATH, 0x0, (char *)&msg, sizeof(msg));
        if (0 != ret)
        {
            printk("Write misc [%s] failed!\n", MISC_DEV_SECOND_PATH);
        }
    }

	kernel_restart(NULL);

    return ret;
}

int set_misc_msg_for_recovery(void)
{
    int ret = -1;
    misc_bootmsg_type msg;

    memset((void *)&msg, 0, sizeof(msg));
    memcpy(msg.command, (void *)RECOVERY_CMD_STR, strlen(RECOVERY_CMD_STR));
    ret = write_ufs_part(MISC_DEV_FIRST_PATH, 0x0, (char *)&msg, sizeof(msg));
    if (0 != ret)
    {
        printk("Write misc [%s] failed!\nWrite mics [%s] now!\n",
            MISC_DEV_FIRST_PATH, MISC_DEV_SECOND_PATH);
        ret = write_ufs_part(MISC_DEV_SECOND_PATH, 0x0, (char *)&msg, sizeof(msg));
        if (0 != ret)
        {
            printk("Write misc [%s] failed!\n", MISC_DEV_SECOND_PATH);
        }
    }

	kernel_restart("recovery");

    return ret;
}

int set_misc_msg_for_bootloader(void)
{
    int ret = -1;
    misc_bootmsg_type msg;

    memset((void *)&msg, 0, sizeof(msg));
    memcpy(msg.command, (void *)BOOTLOADER_CMD_STR, strlen(BOOTLOADER_CMD_STR));
    ret = write_ufs_part(MISC_DEV_FIRST_PATH, 0x0, (char *)&msg, sizeof(msg));
    if (0 != ret)
    {
        printk("Write misc [%s] failed!\nWrite mics [%s] now!\n",
            MISC_DEV_FIRST_PATH, MISC_DEV_SECOND_PATH);
        ret = write_ufs_part(MISC_DEV_SECOND_PATH, 0x0, (char *)&msg, sizeof(msg));
        if (0 != ret)
        {
            printk("Write misc [%s] failed!\n", MISC_DEV_SECOND_PATH);
        }
    }

	kernel_restart("bootloader");

    return ret;
}
