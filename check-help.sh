#!/bin/sh
for script in review.*; do
	[ "$script" = 'review.config.sh' ] && continue
	./$script -h
	echo
	echo =====================
	echo
done
