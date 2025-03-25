connect: decrypt mounte

disconnect: umount encrypt

decrypt:
	sudo cryptsetup luksOpen /dev/sda1 crypt

mounte:
	sudo mount /dev/mapper/crypt /mnt/encrypted/

mount:
	sudo mount /dev/sda1 /mnt/encrypted/

umount:
	sudo umount /mnt/encrypted/

encrypt:
	sudo cryptsetup luksClose crypt
