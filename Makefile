connect: decrypt mounte

disconnect: umount encrypt

decrypt:
	sudo cryptsetup luksOpen /dev/sdb1 crypt

mounte:
	sudo mount /dev/mapper/crypt /mnt/encrypted/

mount:
	sudo mount /dev/sdb1 /mnt/encrypted/

umount:
	sudo umount /mnt/encrypted/

encrypt:
	sudo cryptsetup luksClose crypt
