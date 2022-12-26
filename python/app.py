import sys
import getopt
from random import randint


def get_parameters(argv):
    params = {
        'mode': 'echo',
        'text': '',
        'random_min': int(0),
        'random_max': int(1000)
    }

    options = 'hm:t:'
    long_options = ["help", "mode=", "text=", "randmin=", "randmax="]

    try:
        arguments, values = getopt.getopt(argv, options, long_options)
        for currentArgument, currentValue in arguments:
            if currentArgument in ("-h", "--Help"):
                print("Displaying Help")
            elif currentArgument in ("-m", "--mode"):
                params['mode'] = currentValue
            elif currentArgument in ("-t", "--text"):
                params['text'] = currentValue
            elif currentArgument in ("--randmin"):
                params['random_min'] = currentValue
            elif currentArgument in ("--randmax"):
                params['random_max'] = currentValue

    except getopt.error as err:
        print(str(err))

    return params


def generate_random_number(minimum, maximum):
    return randint(minimum, maximum)


def main(argv):

    params = get_parameters(argv)
    match params['mode']:
        case "echo":
            result = params['text']
        case "random":
            result = generate_random_number(
                int(params['random_min']), int(params['random_max']))

    print(str(result))


if __name__ == "__main__":
    main(sys.argv[1:])
