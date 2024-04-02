# Progress bar

A simple Bash progress bar.

This is a rewrite of the upstream project [edouard-lopez/progress-bar.sh](https://github.com/edouard-lopez/progress-bar.sh)
to simplify the code and fix the following issues:

* The only provided function `progress-bar` was not directly usable for
  anything other than showing an example of a progress bar.  I added a the
  `progress` function which does what I assume most actually users need: it
  takes an elapsed and total value and displays a progress bar representing the
  given values.
* The upstream code used redundant arithmetic operations. For example multiplying by `100/100`.
* The function did not properly clear the current line when resetting the cursor with `\r`.
* The function printed `tput` error messages if `TERM` had an unsupported value
  (this can happen on CI servers, for example).
* Testing the function requires sourcing the shell script. It should be able to
  test with an example script e.g. `./example.sh`.
* I disliked the original author's use of 'sexy' to describe a simple Bash utility function.

The original solution of the upstream project originated from this Stack Overflow question:
[How to add a progress bar to a shell script](https://stackoverflow.com/questions/238073/how-to-add-a-progress-bar-to-a-shell-script)

## Usage

Test the function by running `./example.sh`. It demonstrates an animated
progress bar looking like this:

    ▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇▇░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ 30%


Use the function in your script by sourcing `progress.sh` and calling the
progress function:

    source ./progress.sh
    progress 5 10


## License

> MIT jesper.oqvist@gmail.com
