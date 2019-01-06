# Centos Web Server

<object data="../../assets/centos-first-15.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="../../assets/centos-first-15.pdf">
        <p>This browser does not support PDFs. Please download the PDF to view it: <a href="http://yoursite.com/the.pdf">Download PDF</a>.</p>
    </embed>
</object>


## List Services without iptables

```bash
for service in /etc/init.d/*; do if [[ $(basename $service) != "iptables" ]]; then sudo service $(basename $service) status; fi; done
```
