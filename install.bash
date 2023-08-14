#!/bin/bash

wd=$(echo $PWD)

mkdir img iso run
echo "#!/bin/bash
if [ \"\$1\" == \"new\" ]; then

	read -p \"Disk Name: \" image
	read -p \"Disk Size (MB): \" disksize
 	ls $wd/iso
	read -p \"Iso: \" iso
	read -p \"Ram (MB): \" ram
	read -p \"Cores: \" cores
 	read -p \"Architecture: \" cpuarch
	
	sudo qemu-img create $wd/img/\$image.img \${disksize}M
	sudo qemu-system-\$cpuarch -smp cores=\$cores -boot d -cdrom $wd/iso/\$iso.iso -m \$ram -hda $wd/img/\$image.img

	sudo echo \"#!/bin/bash
sudo qemu-system-\$cpuarch -m \$ram -smp cores=\$cores -drive format=raw,file=$wd/img/\$image.img
	\" > $wd/run/run\$image.sh
	sudo chmod +x $wd/run/run\$image.sh

elif [ \"\$1\" == \"run\" ]; then

 	ls $wd/img
	read -p \"Boot into: \" image
	sudo $wd/run/run\$image.sh

elif [ \"\$1\" == \"del\" ]; then

 	ls $wd/img
	read -p \"Delete: \" image
	sudo rm $wd/img/\$image.img
	sudo rm $wd/run/run\$image.sh

fi
" > vm
chmod +x vm
