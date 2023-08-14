# BashQemuScript

This is a Bash script I wrote to manage my Virtual Machines.  
It requires: qemu-img, qemu-system-(insert architecture type here)

To build, put `install.bash` in your vm directory and run
```
$ chmod +x install.bash
$ ./install.bash
```

Put a iso file in the iso directory.

To make new vm, run
```
$ ./vm new
Disk name: <name of your vm>
Disk size (MB): <12000>
Iso: <iso name from iso directory without .iso ending>
Cores: <number of cores>
$
```
and the vm will boot into the iso.

To run vm, run
```
$ ./vm run
Boot into: <vm name>
$
```

To delete vm, run
```
$ ./vm del
Delete: <vm name>
$
```
