---
title: "Sharing Secrets"
tags: [ "data", "death", "secrets", "ssss" ]
---

You can share parts of a secret with multiple people, so only some of them need to agree to see the secret.

Install `ssss`, then decide on the total number of secrets (`N`), and the threshold of people who must share their shard of the secret in order to reveal the secret.

```bash
N=5
T=3
FILE=secret.txt
fortune | ssss-split -t $T -n $N > $FILE
```
Each shard is a line inside secret.txt.

Check it's working:

```bash
head -n $T $FILE | ssss-combine -t $T
tail -n $T $FILE | ssss-combine -t $T
```
