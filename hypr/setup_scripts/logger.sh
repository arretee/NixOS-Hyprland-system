RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
MAGENTA="\033[1;35m"
CYAN="\033[1;36m"

RESET="\033[0m"


info() {
    echo -e "${BLUE}[INFO]${RESET} $1"
}

success() {
    echo
    echo -e "${GREEN}[ OK ]${RESET} $1"
    echo
}

warning() {
    echo -e "${YELLOW}[WARN]${RESET} $1"
}

error() {
    echo -e "${RED}[FAIL]${RESET} $1"
}

title() {
    echo -e "${MAGENTA}------------ $1 ------------${RESET}"
}

sub_title(){
    echo -e "${CYAN}---- $1 ----${RESET}"
}