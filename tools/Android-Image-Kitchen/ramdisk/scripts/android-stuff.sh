#!/bin/sh -e
chown maddocks:system /sys/class/hisi_thermal/spm/spm_mode
chown maddocks:system /sys/class/hisi_thermal/spm/vr_mode
chown maddocks:system /sys/class/hisi_thermal/spm/spm_freq
chown maddocks:system /sys/class/hisi_thermal/spm/vr_freq
chown maddocks:system /sys/class/hisi_thermal/spm/min_freq
chown maddocks:system /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chown maddocks:system /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chown maddocks:system /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chown maddocks:system /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chown maddocks:system /sys/devices/virtual/thermal/thermal_zone0/boost
chown maddocks:system /sys/devices/virtual/thermal/thermal_zone0/boost_timeout
chown maddocks:system /sys/class/devfreq/gpufreq/max_freq
chown maddocks:system /sys/class/devfreq/gpufreq/min_freq
chown maddocks:system /sys/class/devfreq/gpufreq/cur_freq
chown maddocks:system /sys/class/devfreq/gpufreq/available_frequencies
chown maddocks:system /sys/class/devfreq/gpufreq/mali_ondemand/animation_boost
chown maddocks:system /sys/class/devfreq/gpufreq/mali_ondemand/animation_boost_freq
chown maddocks:system /sys/class/devfreq/ddrfreq/max_freq
chown maddocks:system /sys/class/devfreq/ddrfreq/min_freq
chown maddocks:system /sys/class/devfreq/ddrfreq/ddr_bandwidth
chown maddocks:system /sys/class/devfreq/ddrfreq/cur_freq
chown maddocks:system /sys/class/devfreq/ddrfreq/available_frequencies
chown maddocks:system /sys/kernel/set_hmp_thresholds/policy
chown maddocks:system /sys/class/thermal/thermal_zone0/mode
chown maddocks:system /sys/class/thermal/thermal_zone0/trip_point_0_temp
chown maddocks:system /sys/class/thermal/thermal_zone0/trip_point_1_temp
chown maddocks:system /sys/class/thermal/thermal_zone0/sustainable_power
chown maddocks:system /sys/kernel/hmp/task_fork_on_bigcluster
chown maddocks:system /sys/kernel/hmp/boost
chown maddocks:system /sys/kernel/perfhub/cpuaffinity
chown maddocks:system /sys/class/graphics/fb0/lcd_fps_scence
chown maddocks:system /sys/touchscreen/anti_false_touch_param
chown maddocks:system /sys/class/camerafs/node/thermal_meter0
chown maddocks:system /sys/class/camerafs/node/thermal_meter1
chown maddocks:system /sys/class/camerafs/node/thermal_meter2
echo 0 > /sys/class/devfreq/ddrfreq/min_freq
echo 0 > /sys/class/devfreq/ddrfreq/max_freq
echo 0 > /sys/class/devfreq/ddrfreq_latency/min_freq
echo 0 > /sys/class/devfreq/ddrfreq_latency/max_freq
echo 1866000000 > /sys/class/devfreq/ddrfreq_up_threshold/max_freq
echo 1866000000 > /sys/class/devfreq/ddrfreq_up_threshold/min_freq
chown root:system /sys/kernel/virt_to_phys
chown maddocks:system /dev/cpuctl
chown maddocks:system /dev/cpuctl/tasks
echo 1024 > /dev/cpuctl/cpu.shares
echo 800000 > /dev/cpuctl/cpu.rt_runtime_us
echo 1000000 > /dev/cpuctl/cpu.rt_period_us
chown maddocks:system /dev/cpuctl/bg_non_interactive/tasks
echo 52 > /dev/cpuctl/bg_non_interactive/cpu.shares
echo 700000 > /dev/cpuctl/bg_non_interactive/cpu.rt_runtime_us
echo 1000000 > /dev/cpuctl/bg_non_interactive/cpu.rt_period_us
echo 0-7 > /dev/cpuset/foreground/cpus
echo 0 > /dev/cpuset/foreground/mems
echo 0-7 > /dev/cpuset/foreground/boost/cpus
echo 0 > /dev/cpuset/foreground/boost/mems
echo 0-3 > /dev/cpuset/background/cpus
echo 0 > /dev/cpuset/background/mems
echo 0-3 > /dev/cpuset/system-background/cpus
echo 0 > /dev/cpuset/system-background/mems
echo 0-7 > /dev/cpuset/top-app/cpus
echo 0 > /dev/cpuset/top-app/mems
chown maddocks:system /dev/cpuset
chown maddocks:system /dev/cpuset/foreground
chown maddocks:system /dev/cpuset/foreground/boost
chown maddocks:system /dev/cpuset/background
chown maddocks:system /dev/cpuset/system-background
chown maddocks:system /dev/cpuset/top-app
chown maddocks:system /dev/cpuset/tasks
chown maddocks:system /dev/cpuset/foreground/tasks
chown maddocks:system /dev/cpuset/foreground/boost/tasks
chown maddocks:system /dev/cpuset/background/tasks
chown maddocks:system /dev/cpuset/system-background/tasks
chown maddocks:system /dev/cpuset/top-app/tasks
echo interactive > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo 1402000 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/hispeed_freq
echo 95 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/go_hispeed_load
echo 75:999000:85:1402000:90:1709000:95 > /sys/devices/system/cpu/cpu0/cpufreq/interactive/target_loads
chown maddocks:system /sys/devices/system/cpu/cpu0/cpufreq/interactive/boostpulse
echo interactive > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo 1421000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/hispeed_freq
echo 90 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/go_hispeed_load
echo 85:1421000:90:1805000:95 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/target_loads
echo 39000:1421000:89000:1805000:19000 > /sys/devices/system/cpu/cpu4/cpufreq/interactive/above_hispeed_delay
chown maddocks:system /sys/kernel/debug/freqdump/loadmonitor_enable
chown maddocks:system /sys/kernel/debug/freqdump/loadmonitor_disable
echo 0 > /sys/kernel/hmp/boost
echo 0 > /sys/kernel/set_hmp_thresholds/enable
echo 700 > /sys/kernel/hmp/up_threshold
echo 384 > /sys/kernel/hmp/down_threshold
echo 1 > /sys/kernel/hmp/task_fork_on_bigcluster
echo 1 > /sys/kernel/set_hmp_thresholds/enable
echo 1 > /sys/devices/platform/huawei_sensor/set_fingersense_enable
echo 1 > /sys/devices/platform/huawei_touch/roi_enable
chown radio:radio /dev/madapt
chown media_rw:media_rw /data/share
chown maddocks:system /sys/bus/platform/drivers/huawei,camcfgdev/guard_thermal
chown maddocks:system /sys/class/leds/torch/brightness
chown maddocks:system /sys/class/leds/torch/flash_thermal_protect
chown maddocks:system /sys/class/camerafs/node/dual_leds
chown maddocks:system /sys/class/camerafs/node/lightness
chown maddocks:system /sys/class/camerafs/ois/ois_aging
chown maddocks:system /sys/class/camerafs/ois/ois_pixel
chown maddocks:system /sys/class/camerafs/ois/ois_check
chown maddocks:system /sys/class/camerafs/ois/ois_icnum
chown root:radio /sys/kernel/sim/sim0_hotplug_state
chown root:radio /sys/kernel/sim/sim1_hotplug_state
chown root:radio /sys/kernel/sim/sim_hotplug_state
chown maddocks:system /sys/class/leds/lcd_backlight0/brightness
echo 1 > /sys/kernel/pmic_mntn/pmic_exch
chown maddocks:system /dev/sensorhub
chown maddocks:system /dev/motionhub
chown maddocks:system /sys/devices/platform/huawei_sensor/acc_info
chown maddocks:system /sys/devices/platform/huawei_sensor/mag_info
chown maddocks:system /sys/devices/platform/huawei_sensor/gyro_info
chown maddocks:system /sys/devices/platform/huawei_sensor/als_info
chown maddocks:system /sys/devices/platform/huawei_sensor/ps_info
chown maddocks:system /sys/devices/platform/huawei_sensor/gyro_selfTest
chown maddocks:system /sys/devices/platform/huawei_sensor/mag_selfTest
chown maddocks:system /sys/devices/platform/huawei_sensor/acc_calibrate
chown maddocks:system /sys/devices/platform/huawei_sensor/acc_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/acc_setdelay
chown maddocks:system /sys/devices/platform/huawei_sensor/acc_selfTest
chown maddocks:system /sys/devices/platform/huawei_sensor/mag_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/mag_setdelay
chown maddocks:system /sys/devices/platform/huawei_sensor/gyro_calibrate
chown maddocks:system /sys/devices/platform/huawei_sensor/gyro_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/gyro_setdelay
chown maddocks:system /sys/devices/platform/huawei_sensor/als_calibrate
chown maddocks:system /sys/devices/platform/huawei_sensor/als_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/als_setdelay
chown maddocks:system /sys/devices/platform/huawei_sensor/sbl_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/sbl_setdelay
chown maddocks:system /sys/devices/platform/huawei_sensor/sbl_setbacklight
chown maddocks:system /sys/devices/platform/huawei_sensor/ps_calibrate
chown maddocks:system /sys/devices/platform/huawei_sensor/ps_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/ps_setdelay
chown maddocks:system /sys/devices/platform/huawei_sensor/os_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/os_setdelay
chown maddocks:system /sys/devices/platform/huawei_sensor/lines_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/lines_setdelay
chown maddocks:system /sys/devices/platform/huawei_sensor/gras_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/gras_setdelay
chown maddocks:system /sys/devices/platform/huawei_sensor/rvs_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/rvs_setdelay
chown maddocks:system /sys/devices/platform/huawei_sensor/i2c_rw
chown maddocks:system /sys/devices/platform/huawei_sensor/dt_motion_stup
chown maddocks:system /sys/devices/platform/huawei_sensor/dt_stop_auto_motion
chown maddocks:system /sys/devices/platform/huawei_sensor/dt_sensor_stup
chown maddocks:system /sys/devices/platform/huawei_sensor/dt_stop_auto_data
chown maddocks:system /sys/devices/platform/huawei_sensor/airpress_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/airpress_setdelay
chown maddocks:system /sys/devices/platform/huawei_sensor/airpress_info
chown maddocks:system /sys/devices/platform/huawei_sensor/airpress_set_calidata
chown maddocks:system /sys/devices/platform/huawei_sensor/dt_stepcounter_stup
chown maddocks:system /sys/devices/platform/huawei_sensor/handpress_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/handpress_info
chown maddocks:system /sys/devices/platform/huawei_sensor/handpress_read_data
chown maddocks:system /sys/devices/platform/huawei_sensor/handpress_setdelay
chown maddocks:system /sys/devices/platform/huawei_sensor/read_airpress
chown maddocks:system /sys/devices/platform/huawei_sensor/read_temperature
chown maddocks:system /sys/devices/platform/huawei_sensor/ois_ctrl
chown maddocks:system /sys/devices/platform/huawei_sensor/hifi_supported
chown maddocks:system /sys/class/sensors/acc_sensorlist_info
chown maddocks:system /sys/class/sensors/mag_sensorlist_info
chown maddocks:system /sys/class/sensors/gyro_sensorlist_info
chown maddocks:system /sys/class/sensors/ps_sensorlist_info
chown maddocks:system /sys/class/sensors/als_sensorlist_info
chown maddocks:system /sys/class/sensors/airpress_sensorlist_info
chown maddocks:system /sys/class/sensors/airpress_sensorlist_info
chown maddocks:system /sys/class/sensors/sensorhub_dbg
chown maddocks:system /sys/class/sensors/acc_sensor/enable
chown maddocks:system /sys/class/sensors/acc_sensor/set_delay
chown maddocks:system /sys/class/sensors/acc_sensor/info
chown maddocks:system /sys/class/sensors/acc_sensor/get_data
chown maddocks:system /sys/class/sensors/acc_sensor/self_test
chown maddocks:system /sys/class/sensors/acc_sensor/self_test_timeout
chown maddocks:system /sys/class/sensors/acc_sensor/calibrate
chown maddocks:system /sys/class/sensors/acc_sensor/calibrate_timeout
chown maddocks:system /sys/class/sensors/gyro_sensor/enable
chown maddocks:system /sys/class/sensors/gyro_sensor/set_delay
chown maddocks:system /sys/class/sensors/gyro_sensor/info
chown maddocks:system /sys/class/sensors/gyro_sensor/get_data
chown maddocks:system /sys/class/sensors/gyro_sensor/self_test
chown maddocks:system /sys/class/sensors/gyro_sensor/self_test_timeout
chown maddocks:system /sys/class/sensors/gyro_sensor/calibrate
chown maddocks:system /sys/class/sensors/gyro_sensor/calibrate_timeout
chown maddocks:system /sys/class/sensors/mag_sensor/enable
chown maddocks:system /sys/class/sensors/mag_sensor/set_delay
chown maddocks:system /sys/class/sensors/mag_sensor/info
chown maddocks:system /sys/class/sensors/mag_sensor/get_data
chown maddocks:system /sys/class/sensors/mag_sensor/self_test
chown maddocks:system /sys/class/sensors/mag_sensor/self_test_timeout
chown maddocks:system /sys/class/sensors/mag_sensor/calibrate_method
chown maddocks:system /sys/class/sensors/als_sensor/enable
chown maddocks:system /sys/class/sensors/als_sensor/set_delay
chown maddocks:system /sys/class/sensors/als_sensor/info
chown maddocks:system /sys/class/sensors/als_sensor/get_data
chown maddocks:system /sys/class/sensors/als_sensor/calibrate
chown maddocks:system /sys/class/sensors/als_sensor/calibrate_timeout
chown maddocks:system /sys/class/sensors/als_sensor/sleeve_test_threshhold
chown maddocks:system /sys/class/sensors/ps_sensor/enable
chown maddocks:system /sys/class/sensors/ps_sensor/set_delay
chown maddocks:system /sys/class/sensors/ps_sensor/info
chown maddocks:system /sys/class/sensors/ps_sensor/get_data
chown maddocks:system /sys/class/sensors/ps_sensor/calibrate
chown maddocks:system /sys/class/sensors/ps_sensor/calibrate_timeout
chown maddocks:system /sys/class/sensors/ps_sensor/sleeve_test_prepare
chown maddocks:system /sys/class/sensors/hall_sensor/enable
chown maddocks:system /sys/class/sensors/hall_sensor/set_delay
chown maddocks:system /sys/class/sensors/hall_sensor/info
chown maddocks:system /sys/class/sensors/hall_sensor/get_data
chown maddocks:system /sys/class/sensors/airpress_sensor/enable
chown maddocks:system /sys/class/sensors/airpress_sensor/set_delay
chown maddocks:system /sys/class/sensors/airpress_sensor/info
chown maddocks:system /sys/class/sensors/airpress_sensor/get_data
chown maddocks:system /sys/class/sensors/airpress_sensor/read_airpress
chown maddocks:system /sys/class/sensors/airpress_sensor/set_calidata
chown maddocks:system /sys/class/sensors/fingersense_sensor/set_fingersense_enable
chown maddocks:system /sys/class/sensors/fingersense_sensor/fingersense_data_ready
chown maddocks:system /sys/class/sensors/fingersense_sensor/fingersense_latch_data
chown maddocks:system /sys/class/sensors/fingersense_sensor/fingersense_req_data
chown maddocks:system /sys/class/sensors/ois_sensor/ois_ctrl
chown maddocks:system sys/class/sensors/cap_prox_sensor/calibrate
chown maddocks:system sys/class/sensors/cap_prox_sensor/calibrate_timeout
chown maddocks:system sys/class/sensors/cap_prox_sensor/cap_prox_calibrate_type
chown maddocks:system sys/class/sensors/cap_prox_sensor/cap_prox_calibrate_order
chown maddocks:system /sys/devices/platform/huawei_sensorhub_logbuff/logbuff_config
chown maddocks:system /sys/devices/platform/huawei_sensorhub_logbuff/logbuff_flush
chown maddocks:system /sys/class/sensors/libsensor_ver
chown maddocks:system /sys/devices/platform/huawei_sensor/set_fingersense_enable
chown maddocks:system /sys/devices/platform/huawei_sensor/fingersense_req_data
chown maddocks:system /sys/devices/platform/huawei_sensor/fingersense_data_ready
chown maddocks:system /sys/devices/platform/huawei_sensor/fingersense_latch_data
chown maddocks:system /sys/devices/platform/huawei_sensor/gsensor_gather_enable
chown maddocks:system /sys/class/hall/hall/state
chown maddocks:system /sys/class/hall/hall/report
chown maddocks:system /sys/class/hall/hall/info
chown maddocks:system /sys/class/hall/hall/count
chown maddocks:system /sys/class/hall/hall/enable
chown maddocks:system /sys/class/hall/hall/flag
chown maddocks:system /sys/class/hall/hall/period
chown maddocks:system /sys/class/hall/hall/report_count
chown maddocks:system /sys/class/hall/hall/value
chown nfc:nfc /sys/nfc/nfc_wired_ese_type
chown nfc:nfc /sys/nfc/nfc_activated_se_info
chown nfc:nfc /sys/nfc/nfc_hal_dmd
chown nfc:nfc /sys/nfc/nfc_calibration
chown nfc:nfc /sys/devices/platform/0.hisee/hisee_power
chown nfc:nfc /sys/devices/platform/0.hisee/hisee_apdu
chown nfc:nfc /sys/devices/platform/0.hisee/hisee_check_ready
chown nfc:nfc /sys/devices/platform/0.hisee/hisee_has_new_cos
chown root:audio /proc/hifidsp/hifi
chown root:audio /proc/hifidsp/hifi_pcm_read
echo 32768 > /proc/sys/net/core/rps_sock_flow_entries
echo 4096 > /sys/class/net/rmnet0/queues/rx-0/rps_flow_cnt
echo e > /sys/class/net/rmnet0/queues/rx-0/rps_cpus
echo 4096 > /sys/class/net/rmnet1/queues/rx-0/rps_flow_cnt
echo e > /sys/class/net/rmnet1/queues/rx-0/rps_cpus
echo 4096 > /sys/class/net/rmnet2/queues/rx-0/rps_flow_cnt
echo e > /sys/class/net/rmnet2/queues/rx-0/rps_cpus
echo 4096 > /sys/class/net/rmnet3/queues/rx-0/rps_flow_cnt
echo e > /sys/class/net/rmnet3/queues/rx-0/rps_cpus
echo 4096 > /sys/class/net/rmnet4/queues/rx-0/rps_flow_cnt
echo e > /sys/class/net/rmnet4/queues/rx-0/rps_cpus
echo 4096 > /sys/class/net/rmnet_ims/queues/rx-0/rps_flow_cnt
echo e > /sys/class/net/rmnet_ims/queues/rx-0/rps_cpus
echo 2000 > /proc/sys/net/core/netdev_max_backlog
echo 0 > /proc/sys/net/netfilter/nf_conntrack_checksum
chown maddocks:system /sys/class/leds/keyboard-backlight/brightness
chown maddocks:system /sys/class/leds/keyboard-backlight/keybacklight
chown system:camera /data/camera
chown system:camera /data/img
chown root:system /data/ioloader
