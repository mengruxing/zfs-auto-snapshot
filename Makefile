PREFIX := /usr/local

install-base:
	install -d $(DESTDIR)$(PREFIX)/share/man/man8
	install -m 0644 src/zfs-auto-snapshot.8 $(DESTDIR)$(PREFIX)/share/man/man8/zfs-auto-snapshot.8
	install -d $(DESTDIR)$(PREFIX)/sbin
	install src/zfs-auto-snapshot.sh $(DESTDIR)$(PREFIX)/sbin/zfs-auto-snapshot

install-hourly:
	install -d $(DESTDIR)/etc/cron.hourly
	install etc/zfs-auto-snapshot.cron.hourly   $(DESTDIR)/etc/cron.hourly/zfs-auto-snapshot

install-daily:
	install -d $(DESTDIR)/etc/cron.daily
	install etc/zfs-auto-snapshot.cron.daily    $(DESTDIR)/etc/cron.daily/zfs-auto-snapshot

install-weekly:
	install -d $(DESTDIR)/etc/cron.weekly
	install etc/zfs-auto-snapshot.cron.weekly   $(DESTDIR)/etc/cron.weekly/zfs-auto-snapshot

install-monthly:
	install -d $(DESTDIR)/etc/cron.monthly
	install etc/zfs-auto-snapshot.cron.monthly  $(DESTDIR)/etc/cron.monthly/zfs-auto-snapshot

all:

install: install-base install-hourly install-daily install-weekly install-monthly

uninstall:
	rm $(DESTDIR)/etc/cron.hourly/zfs-auto-snapshot
	rm $(DESTDIR)/etc/cron.daily/zfs-auto-snapshot
	rm $(DESTDIR)/etc/cron.weekly/zfs-auto-snapshot
	rm $(DESTDIR)/etc/cron.monthly/zfs-auto-snapshot
	rm $(DESTDIR)$(PREFIX)/sbin/zfs-auto-snapshot
	rm $(DESTDIR)$(PREFIX)/share/man/man8/zfs-auto-snapshot.8
