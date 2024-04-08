
#ifndef ERECOVERY_BOOT_H
#define ERECOVERY_BOOT_H



int read_ufs_part(const char *part_name, unsigned long long offset, char *buf, unsigned long long buf_size);
int write_ufs_part(const char *part_name, unsigned long long offset, char *buf, unsigned long long buf_size);
int set_misc_msg_for_erecovery(void);
int clear_misc_msg_for_erecovery(void);
int set_misc_msg_for_recovery(void);
int set_misc_msg_for_bootloader(void);

#endif /* ERECOVERY_BOOT_H */
