

INAME = "eth0"

a = SUSEIfcfg::Ifcfg.new("eth0")
a.startmode = :auto
a.bootproto = :static
a.ipaddr = "192.168.1.1"
a.prefixlen = 16
a.save

b = SUSEIfcfg::Ifcfg.new("eth1")
b.startmode = :auto
b.bootproto = :static
b.ipaddr = "192.168.1.2/16"
b.save

c = SUSEIfcfg::Ifcfg.new("eth2")
c.startmode = :auto
c.bootproto = :static
c.ipaddr = "192.168.1.1"
c.netmask = "255.255.0.0"
c.save

