"""Will pylint all python files, and run all tests (python files starting with test_) in the
target directory
Usage: python this_script <target_dir>"""
import sys
import os
from glob import glob
import subprocess

def usage(message=None):
    """Print Script usage message and die"""
    #TODO put this all on stderr
    if message:
        print "ERROR:",message
    #TODO - Find out if we can get the module docstring and use this
    print """Usage: python this_script <target_dir>
Will pylint all python files, and run all tests (python files starting with test_) in the
target directory"""
    exit(1)

pylint_parseable="--output-format=parseable"

def pylint_errors_only_in_dir(target_dir):
    """run pylint with errors only on the target directory. 
    Allow output to standard out, parseable.
    Fail if it dies"""
    try:
        subprocess.check_call("pylint --errors-only " + pylint_parseable + " *.py", cwd=target_dir, shell=True)
    except subprocess.CalledProcessError:
        print "Failed during pylint."
        exit(1)

def run_tests_in_dir(target_dir):
    """Run each of the python tests in the directory"""
    for test in glob(os.path.join(target_dir,"test*.py")):
        print "Testing",test
        subprocess.check_call("python -u " + test, cwd = target_dir, shell=True)

def main(target_dir):
    os.path.isdir(target_dir) or usage("Target "+ target_dir + " doesn't exist or is not a directory")
    python_files = glob(os.path.join(target_dir,"*.py"))
    if len(python_files) == 0:
        usage("No python files in target directory " + target_dir)
    print("Looking for pylint errors")
    pylint_errors_only_in_dir(target_dir)
    print("Errors not found. Running tests")
    run_tests_in_dir(target_dir)
#    print("Tests passed. Looking for pylint moans")
#   pylint_all_in_dir(target_dir)

if __name__ == "__main__":
    target_dir = os.getcwd()
    if(len(sys.argv) > 1):
        target_dir = sys.argv[1]
    main(target_dir)
