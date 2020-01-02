The Pluggabble Authentication Module controls minimum security requirements, such as password lengths.

Configuration rests in `/etc/pam.d/common-password`, or sometimes `system-auth`.

The file might be edited to contain:

``` 

password required pam_cracklib.so minlen=12 lcredit=1 
 
ucredit=1 dcredit=2 ocredit=1 

```
 
This would enforce a minimum length of 12 characters for a password, one lowercase character, one upper case character, two digits, and one other (special) character.

