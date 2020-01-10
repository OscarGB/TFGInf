if [ $(dpkg-query -W -f='${Status}' virtualenv 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt install -y virtualenv;
fi

virtualenv -p python3 .venv

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

echo "alias TFG='cd $SCRIPTPATH; source $SCRIPTPATH/.venv/bin/activate; jupyter-notebook'" >> ~/.bashrc

source .venv/bin/activate

pip3 install -r requirements.txt

