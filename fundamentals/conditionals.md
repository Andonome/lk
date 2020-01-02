# If statements

Test statement equality as so:

```

read t1
read t2
if test $t1 != $t2; then
	echo 'variables do not match'
else
	echo 'variables match'
fi
exit 0

```

# Case Structure

These deal with multiple states rather than forking conditions.

Example: 

```

#!/bin/bash

# Simple case demonstration

echo "What's your favourite creature?"
read CRE
case $CRE in
        human | humanoids ) echo "Why is $CRE always standard?"
;;
        troll | monsters ) echo "Not exactly known for their character ..."
;;
        owlbears | monsters ) echo "Really you're a wizard fan"
;;
esac

# While and Until
This prints from 10 until 2.

> declare -i COUNTER

> COUNTER=10

> while [ $COUNTER -gt 2 ]; do

        > echo The counter is $COUNTER

        > COUNTER=COUNTER-1

> done

> exit 0

```


There's also 'until', which stops when something is true, rather than keeping going when something is true.

# For

> for i in $( ls ); do
> 	du -sh $i
> done

# Sequences

The sequences tool counts up from X in jumps of Y to number Z.

Count from 1 to 10.

> seq 10

Count from 4 to 11.

> seq 4 11

Count from 1 to 100 in steps of 5.

> seq 1 5 100

