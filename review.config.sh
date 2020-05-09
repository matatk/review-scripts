# shellcheck shell=sh
export START_DATE='8th August 2017'  # HTML 5.2 CR was published on this day
export END_DATE='17th July 2019'     # Review draft was published on the 16th
export NONESSENTIAL_COMMIT_MSG_EXTENDED_REGEXP='^.{8} (Editorial|Meta): '
export SOURCE_FILE='source'
export URL_COMMIT_START='https://github.com/whatwg/html/commit'  # / added later

export REVIEW_CHANNEL=''
export STATE_PREFIX='review.state'
export STATE_SUFFIX_TO_REVIEW='.todo'
export STATE_SUFFIX_IN_REVIEW='.current'
export STATE_SUFFIX_REVIEWED='.done'
export STATE_SUFFIX_PARKED='.parked'
export FILE_COMMITS_TO_REVIEW="$STATE_PREFIX${REVIEW_CHANNEL:+.}$REVIEW_CHANNEL$STATE_SUFFIX_TO_REVIEW"
export FILE_COMMIT_IN_REVIEW="$STATE_PREFIX${REVIEW_CHANNEL:+.}$REVIEW_CHANNEL$STATE_SUFFIX_IN_REVIEW"
export FILE_COMMITS_REVIEWED="$STATE_PREFIX${REVIEW_CHANNEL:+.}$REVIEW_CHANNEL$STATE_SUFFIX_REVIEWED"
export FILE_COMMITS_PARKED="$STATE_PREFIX${REVIEW_CHANNEL:+.}$REVIEW_CHANNEL$STATE_SUFFIX_PARKED"

export HTML_STYLE='
	table { border-collapse: collapse; }
	th, td { padding: 0.5em; }
	th { background-color: #555; color: white; }
	tr:nth-child(even) { background-color: #eee; }
	tr:nth-child(odd) { background-color: #ccc; }'
