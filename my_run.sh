#!/bin/bash

# SMAC test
# python3 src/main.py --config=qmix --env-config=sc2 with env_args.map_name=1c3s5z env_args.seed=1 local_results_path='../../../tmp_DD/sc2_1c3s5z/results/' save_model=True use_tensorboard=True save_model_interval=200000 t_max=2060000 
# is_save_buffer=True save_buffer_size=20000 save_buffer_id=0

CUDA_VISIBLE_DEVICES=1 python3 src/main.py --config=qmix --env-config=sc2 with env_args.map_name=2c_vs_64zg t_max=2060000
CUDA_VISIBLE_DEVICES=1 python3 src/main.py --config=linda --env-config=sc2 with env_args.map_name=2c_vs_64zg t_max=2060000 test_interval=10000

CUDA_VISIBLE_DEVICES=1 python3 src/main.py --config=qmix --env-config=sc2 with env_args.map_name=3m t_max=2060000

python3 src/main.py --config=qmix --env-config=sc2 with env_args.map_name=3m

# LBF test
# python3 src/main.py --config=vdn --env-config=gymma with env_args.time_limit=25 env_args.key="lbforaging:Foraging-8x8-2p-1f-coop-v2" use_tensorboard=False t_max=1060000 test_interval=10000

# linda test
# python3 src/main.py --config=linda --env-config=gymma with env_args.time_limit=25 env_args.key="lbforaging:Foraging-8x8-2p-1f-coop-v2" use_tensorboard=True t_max=1060000 test_interval=25000 mixer="vdn"

# CUDA_VISIBLE_DEVICES=1 python3 src/main.py --config=linda --env-config=gymma with env_args.time_limit=25 env_args.key="lbforaging:Foraging-10x10-2p-1f-coop-v2" use_tensorboard=True t_max=1060000 test_interval=25000 mixer="vdn"

# python3 src/main.py --config=linda --env-config=gymma with env_args.time_limit=25 env_args.key="lbforaging:Foraging-16x16-2p-1f-coop-v2" use_tensorboard=True t_max=1060000 test_interval=25000 mixer="vdn"

# use 'CUDA_VISIBLE_DEVICES=<gpu_ids> <python/bash command>' to set program on specified GPU

# repeat for 5 times
# for((i=0;i<5;i++)); do
#   CUDA_VISIBLE_DEVICES=1 python3 src/main.py --config=linda --env-config=gymma with env_args.time_limit=25 env_args.key="lbforaging:Foraging-10x10-2p-1f-coop-v2" use_tensorboard=False t_max=1060000 test_interval=25000 mixer="vdn"
# done

# cd epymarl && conda activate xyc_epymarl

python3 src/main.py --run --config=qmix --env-config=sc2 --map_name=3m with use_wandb=False

python3 src/main.py --collect --config=qmix --env-config=sc2_collect with env_args.map_name=3m offline_data_quality=medium save_replay_buffer=True num_episodes_collected=20 stop_winrate=20

python src/main.py --collect --config=<alg> --env-config=sc2_collect with env_args.map_name=<map_name> offline_data_quality=<quality> save_replay_buffer=<whether_to_save_replay>
num_episodes_collected=<num_episodes_per_collection> stop_winrate=<stop_winrate> --seed=<seed>