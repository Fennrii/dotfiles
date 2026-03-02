CRYPT_NAME := crypt
MOUNTPOINT := /mnt/encrypted
LUKS_UUID := ec5f4902-ca0b-4853-9117-4556196cf8c3

LUKS_DEV := /dev/disk/by-uuid/$(LUKS_UUID)

connect: decrypt mounte

disconnect: umount encrypt

decrypt:
	sudo cryptsetup luksOpen $(LUKS_DEV) $(CRYPT_NAME)

mounte:
	sudo mount /dev/mapper/$(CRYPT_NAME) $(MOUNTPOINT)

mount:
	sudo mount $(LUKS_DEV) $(MOUNTPOINT)

umount:
	sudo umount $(MOUNTPOINT)

encrypt:
	sleep 1
	sudo cryptsetup luksClose $(CRYPT_NAME)

work:
	autorandr -l work
	./.fehbg
