# -*- coding: utf-8 -*-
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :

##
# qvm.sd-whonix
# ==============
#
# Installs 'sd-whonix' ProxyVM for securedrop workstation.
#
##

include:
  - qvm.template-whonix-gw
  - qvm.sys-firewall

sd-whonix:
  qvm.vm:
    - name: sd-whonix
    - present:
      - template: whonix-gw-14
      - label: purple
      - mem: 500
    - prefs:
      - provides-network: true
      - netvm: "sys-firewall"
      - autostart: true
      - kernelopts: "nopat apparmor=1 security=apparmor"
    - tags:
      - add:
        - sd-workstation
    - require:
      - pkg: qubes-template-whonix-gw-14
      - qvm: sys-firewall
