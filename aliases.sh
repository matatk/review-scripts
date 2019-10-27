# shellcheck shell=sh
# These all seem like a good idea
alias rnt='review.next txt'
alias rnw='review.next web'
alias rn='review.next'
alias rp='review.park'
alias ru='review.unpark'
alias rrna='review.record na'
alias rr='review.record log'

# These let you view any commit as with review.next
review_commit_txt() {
	review.next -c "$1" txt
}
alias rct=review_commit_txt

review_commit_web() {
	review.next -c "$1" web
}
alias rcw=review_commit_web

# This one uses a wildcard, so beware
alias rb='tar zcvf "review-state.$(date +%Y-%m-%d.%H%M).tar.gz" review.state.*'
