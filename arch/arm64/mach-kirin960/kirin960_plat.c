#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/platform_device.h>
#include "reboot-erecovery.h"
#include <linux/blkdev.h>
#include <linux/syscalls.h>


MODULE_LICENSE("GPL");
MODULE_AUTHOR("Ben Maddocks");
MODULE_DESCRIPTION("basic exposing of kirin960 soc stuff");
MODULE_VERSION("0.1");

static long erecov = 0;
static long recov = 0;
static long andro = 1;
static long bootl = 0;

void prerebootstuff(void) {
//	netif->flags &= ~NETIF_FLAG_UP;
	blk_power_off_flush(BLK_FLUSH_EMERGENCY);
	sys_sync();
}

static ssize_t reboot_erecovery_show(struct device *dev,
                         struct device_attribute *attr, char *buf)
{
   return sprintf(buf, "%ld", erecov);
}

static ssize_t reboot_erecovery_store(struct device *dev,
                 struct device_attribute *attr,
                 const char *buf, size_t count)
{
   long new_value = 0;
   int ret = 0;
   recov = 0;
   andro = 0;
   bootl = 0;
   erecov = 1;
   if (kstrtol(buf, 10, &new_value) < 0)
     {
        return -EINVAL;
     }

	prerebootstuff();
	ret = set_misc_msg_for_erecovery();
	if (ret) {
	// do something
	}

   return count;
}

static DEVICE_ATTR(reboot_erecovery, 0660, reboot_erecovery_show,
                   reboot_erecovery_store);

static ssize_t reboot_recovery_show(struct device *dev,
                         struct device_attribute *attr, char *buf)
{
   return sprintf(buf, "%ld", recov);
}

static ssize_t reboot_recovery_store(struct device *dev,
                 struct device_attribute *attr,
                 const char *buf, size_t count)
{
   long new_value = 0;
   int ret = 0;
   erecov = 0;
   andro = 0;
   recov = 1;
   bootl = 0;

   if (kstrtol(buf, 10, &new_value) < 0)
     {
        return -EINVAL;
     }

	prerebootstuff();
	ret = set_misc_msg_for_recovery();
	if (ret) {
	// do something
	}

   return count;
}

static DEVICE_ATTR(reboot_recovery, 0660, reboot_recovery_show,
                   reboot_recovery_store);

static ssize_t reboot_android_show(struct device *dev,
                         struct device_attribute *attr, char *buf)
{
   return sprintf(buf, "%ld", andro);
}

static ssize_t reboot_android_store(struct device *dev,
                 struct device_attribute *attr,
                 const char *buf, size_t count)
{
   long new_value = 0;
   int ret = 0;
   erecov = 0;
   recov = 0;
   andro = 1;
   bootl = 0;

   if (kstrtol(buf, 10, &new_value) < 0)
     {
        return -EINVAL;
     }

	prerebootstuff();
	ret = clear_misc_msg_for_erecovery();
	if (ret) {
	// do something
	}

   return count;
}
static DEVICE_ATTR(reboot_android, 0660, reboot_android_show,
                   reboot_android_store);




static ssize_t reboot_bootloader_show(struct device *dev,
                         struct device_attribute *attr, char *buf)
{
   return sprintf(buf, "%ld", bootl);
}

static ssize_t reboot_bootloader_store(struct device *dev,
                 struct device_attribute *attr,
                 const char *buf, size_t count)
{
   long new_value = 0;
   int ret = 0;
   erecov = 0;
   recov = 0;
   andro = 0;
   bootl = 1;

   if (kstrtol(buf, 10, &new_value) < 0)
     {
        return -EINVAL;
     }

	prerebootstuff();
	ret = set_misc_msg_for_bootloader();
	if (ret) {
	// do something
	}

   return count;
}
static DEVICE_ATTR(reboot_bootloader, 0660, reboot_bootloader_show,
                   reboot_bootloader_store);



struct my_device_platform_data
{
   void (*power_on)(struct my_device_platform_data *, struct platform_device *pdev);
   void (*power_off)(struct my_device_platform_data *,struct platform_device *pdev);
   void (*reset)(struct my_device_platform_data *);
};

static void
_power_on(struct my_device_platform_data *sd, struct platform_device *pdev)
{
  int result;
   printk(KERN_INFO "Bens platform driver loaded");
   result = device_create_file(&pdev->dev,
                               &dev_attr_reboot_erecovery);
   if (result < 0)
   {
     printk(KERN_ALERT "Bens platform driver: failed to create reboot to erecovery sysfs file");
     return;
   }
   result = device_create_file(&pdev->dev,
                               &dev_attr_reboot_recovery);
   if (result < 0)
   {
     printk(KERN_ALERT "Bens platform driver: failed to create reboot to recovery sysfs file");
     return;
   }

   result = device_create_file(&pdev->dev,
                               &dev_attr_reboot_android);
   if (result < 0)
   {
     printk(KERN_ALERT "Bens platform driver: failed to create reboot to android sysfs file");
     return;
   }
   result = device_create_file(&pdev->dev,
                               &dev_attr_reboot_bootloader);
   if (result < 0)
   {
     printk(KERN_ALERT "Bens platform driver: failed to create reboot to bootloader sysfs file");
     return;
   }
   else
     printk("Bens platform driver: successfully created file");

}

static void
_power_off(struct my_device_platform_data *sd, struct platform_device *pdev)
{
   printk(KERN_INFO "Bens platform driver: is off");
   device_remove_file(&pdev->dev, &dev_attr_reboot_erecovery);
   device_remove_file(&pdev->dev, &dev_attr_reboot_recovery);
   device_remove_file(&pdev->dev, &dev_attr_reboot_android);
   device_remove_file(&pdev->dev, &dev_attr_reboot_bootloader);
}

static void
_reset(struct my_device_platform_data *sd)
{
   printk(KERN_INFO "Bens platform driver: is powered reset");
}

static struct my_device_platform_data my_device_data = {
//     .reset_gpio = 435,
//     .power_gpio = 436,
     .power_on = _power_on,
     .power_off = _power_off,
     .reset = _reset,
};

static void
_release(struct device *dev)
{
   printk("device.release()");
}

static struct platform_device my_device = {
     .name = "bens-custom-platform-driver",
     .id = -1, //let kernel device
     .dev.platform_data = &my_device_data,
     .dev.release = _release,
};

static int
_sample_platform_driver_probe(struct platform_device *pdev)
{
   struct my_device_platform_data *data;

   printk(KERN_INFO "Bens platform device:  connected/probed");
   ///struct my_driver_data *mdd;

   data = dev_get_platdata(&pdev->dev);

   if (data->power_on) data->power_on(data, pdev);

   return 0;
}

static int
_sample_platform_driver_remove(struct platform_device *pdev)
{
   struct my_device_platform_data *data;

   data = dev_get_platdata(&pdev->dev);

   if (data->power_off) data->power_off(data, pdev);

   printk(KERN_INFO "Bens platform device: removed");
   return 0;
}

static struct platform_driver sample_platform_driver = {
     .probe = _sample_platform_driver_probe,
     .remove = _sample_platform_driver_remove,
     .driver = {
          .name = "bens-custom-platform-driver", //platform_device will also use same name
     },
};

static int __init
_platform_driver_init(void)
{
//   int ret = 0;
   printk(KERN_INFO "Bens platform driver: init");
   platform_driver_register(&sample_platform_driver);
   platform_device_register(&my_device);
/*   ret = clear_misc_msg_for_erecovery();
   if (ret) {
   // blah
   }
   */
   return 0;
}

static void __exit
_platform_driver_exit(void)
{
   printk(KERN_INFO "Bens platform driver: exit");
   platform_driver_unregister(&sample_platform_driver);
   platform_device_unregister(&my_device);
}

module_init(_platform_driver_init);
module_exit(_platform_driver_exit);
