#!/bin/bash

wd=$(echo $PWD)

mkdir img iso run
echo "#!/bin/bash
if [ \"\$1\" == \"new\" ]; then

	read -p \"Disk Name: \" image
	read -p \"Disk Size (MB): \" disksize
	read -p \"Iso: \" iso
	read -p \"Ram (MB): \" ram
	read -p \"Cores: \" cores
 	read -p \"Architecture: \" cpuarch
	
	sudo qemu-img create $rd/img/\$image.img \${disksize}M
	sudo qemu-system-\$cpuarch -smp cores=\$cores -boot d -cdrom $rd/iso/\$iso.iso -m \$ram -hda $rd/img/\$image.img

	sudo echo \"#!/bin/bash
sudo qemu-system-\$cpuarch -m \$ram -smp cores=\$cores -drive format=raw,file=$rd/img/\$name.img
	\" > $rd/run/run\$image.sh
	sudo chmod +x $rd/run/run\$image.sh

elif [ \"\$1\" == \"run\" ]; then

	read -p \"Boot into: \" image
	sudo $rd/run/run\$image.sh

elif [ \"\$1\" == \"del\" ]; then

	read -p \"Delete: \" image
	sudo rm $rd/img/\$image.img
	sudo rm $rd/run/run\$image.sh

fi
" > vm
chmod +x vm
