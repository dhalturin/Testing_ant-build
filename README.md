# Prepare
```
ssh-keygen -R [127.0.0.1]:2222
git clone https://github.com/dhalturin/Testing_ant-build.git
cd Testing_ant-build
```

# Run
- vagrant up

# Result
```
[06:13:22] {dhalturin@macbook-pro.it.lan}~/repos/ant-testing> vagrant up
...
==> default: Buildfile: /home/vagrant/build.xml
==> default:
==> default: prepare:
==> default:      [echo] Debug usage: true
==> default:      [echo] Pull repo: true
==> default:
==> default: clean:
==> default:
==> default: project_clean:
==> default:      [exec] Cloning into '/home/vagrant/project'...
==> default:
==> default: archive:
==> default:      [echo] Fileset using: debug
==> default:       [zip] Building zip: /home/vagrant/build/archive.WG.zip
==> default:       [zip] Building zip: /home/vagrant/build/archive.WG.no-obf.zip
==> default:
==> default: publish:
==> default:      [exec] Warning: Permanently added '127.0.0.1' (ECDSA) to the list of known hosts.
==> default:      [exec] Warning: Permanently added '127.0.0.1' (ECDSA) to the list of known hosts.
==> default:
==> default: init:
==> default:
==> default: BUILD SUCCESSFUL
==> default: Total time: 5 seconds

[06:13:28] {dhalturin@macbook-pro.it.lan}~/repos/ant-testing> ssh 127.0.0.1 -p2222 -lvagrant -i .vagrant/machines/default/virtualbox/private_key -- ls -lah *.zip
-rw-r--r--. 1 vagrant vagrant 13K Aug 25 03:15 archive.WG.no-obf.zip
-rw-r--r--. 1 vagrant vagrant 95K Aug 25 03:15 archive.WG.zip
```
