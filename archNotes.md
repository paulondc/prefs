#### Fix Canon G3070 printer by using ipp everywhere
lpadmin -p G3070 -E -v ipp://<printer_ip>/ipp/print -m everywhere
