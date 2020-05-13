# Changelog

All notable changes to this project will be documented in this file. See [standard-version](https://github.com/conventional-changelog/standard-version) for commit guidelines.

## [0.3.0](https://github.com/matatk/review-scripts/compare/v0.2.0...v0.3.0) (2020-05-13)


### Features

* **Channels:** Support multiple review channels ([215df21](https://github.com/matatk/review-scripts/commit/215df21714458c69811c32454237f642cf78edff))


### Bug fixes

* **Aliases:** Include review.config.sh in backup ([dd54dc3](https://github.com/matatk/review-scripts/commit/dd54dc35f20149eda4810bfb89e35ff5a3011bf7))
* **review.html.done:** Correct the error message ([fbc4e5d](https://github.com/matatk/review-scripts/commit/fbc4e5dd6ca847e3c5ccb756359b5271a31b681d))
* **review.init:** Check for presence of source file ([6e2e942](https://github.com/matatk/review-scripts/commit/6e2e94211c68bdd5f4058b26bc57e5f67287a020))

## [0.2.0](https://github.com/matatk/review-scripts/compare/v0.1.0...v0.2.0) (2019-11-01)


### ⚠ BREAKING CHANGES

* `review.record`'s "l" subcommand is replaced by "log" for consistency.
* The "--help" command-line option is no longer supported (due to the adoption of getopts).

### Features

* Allow custom todo/done files via command line ([ae88e1a](https://github.com/matatk/review-scripts/commit/ae88e1a4edde4ff86fcef58eb3ef7f77ee209767))
* **Aliases:** Add handy "backup" alias ([4f65c13](https://github.com/matatk/review-scripts/commit/4f65c13d9bb0f82df7e0c753d14b3ae6254045b6))
* **review.next:** Count number of parked commits as well as todo ([c5e15a1](https://github.com/matatk/review-scripts/commit/c5e15a142d61454b94ed9e2058eaaac35ae9ae1c))
* **review.next, aliases:** Support arbitrary commits ([24b2f05](https://github.com/matatk/review-scripts/commit/24b2f0597567af0db12b50ad9f6a50bde736747d))


### Bug fixes

* Name `review.record`'s "log" subcommand consistently ([366d54c](https://github.com/matatk/review-scripts/commit/366d54c267841ff35f03bdc2ed5a1eb3c738f8ed))
* **review.next:** Account for no commits being left to review :-) ([179441c](https://github.com/matatk/review-scripts/commit/179441c693955a9d0bf0d5d9a9f2888adc69bce0))
* **review.unpark:** Correctly unpark all when no commits to review ([6638e95](https://github.com/matatk/review-scripts/commit/6638e95a9e05119417c4dee77d5d419008a482a1))


### Documentation

* **Help:** Remove "-- " from help to be in-line with other tools ([29102d4](https://github.com/matatk/review-scripts/commit/29102d48599cc39c73539b79ad4c047ba8cb060f))
* **review.next:** Show hint on initial call ([ee69aa9](https://github.com/matatk/review-scripts/commit/ee69aa964e0f3874c4d19fe88902eafc378c9d4c))

## 0.1.0 (2019-10-17)


### Features

* Scripts to track the progress of reviews ([bb585e9](https://github.com/matatk/review-scripts/commit/bb585e95fe1d74b08b817062c9bab95b4f7c6ced))
