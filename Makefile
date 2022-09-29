base:
	mkdir -p bin
bin/frpc: base
	cd bin; \
	wget -nc https://github.com/fatedier/frp/releases/download/v0.44.0/frp_0.44.0_linux_amd64.tar.gz;\
	tar -xvzf frp*gz;\
	ln -f frp*/* .
install-supervisord:
	python3 -m pip install "supervisor==4.2.4"
	rm -f /etc/systemd/system/supervisord.service
	cp -f etc/supervisord.service /etc/systemd/system
	chown root:root /etc/systemd/system/supervisord.service
	systemctl daemon-reload


