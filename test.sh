#!/bin/bash

emb_dim=200
hid_dim=200
layer_size="[200,200]"
batch_size=512
learning_rate=0.005
dropout=0.3
reg=0.001

DATA="./OMIM/bigraph/cross1"
num_epochs=1000
GPU=-1

gamma=0.1
neg_num=5
seeds=(321 4321 54321)
k=0.5
type=3
mi_kind="js"
alpha=3
beta=0.1
pretrain=./OMIM
f=1
cnts=(1 2 3)

for seed in "${seeds[@]}"; do
    python main.py \
        -dataset $DATA \
        -emb_dim $emb_dim \
        -hid_dim $hid_dim \
        -layer_size $layer_size \
        -batch_size $batch_size \
        -neg_num $neg_num \
        -num_epochs $num_epochs \
        -learning_rate $learning_rate \
        -dropout $dropout \
        -reg $reg \
        -k $k \
        -mi_kind $mi_kind \
        -seed $seed \
        -alpha 3 \
        -beta 0.1 \
        -gamma $gamma \
        -type $type \
        -f $f
        -gpu_id $GPU 

    python main.py \
        -dataset $DATA \
        -emb_dim $emb_dim \
        -hid_dim $hid_dim \
        -layer_size $layer_size \
        -batch_size $batch_size \
        -neg_num $neg_num \
        -num_epochs $num_epochs \
        -learning_rate $learning_rate \
        -dropout $dropout \
        -reg $reg \
        -k $k \
        -mi_kind $mi_kind \
        -seed $seed \
        -alpha 3 \
        -beta 0.1 \
        -gamma $gamma \
        -type $type \
        -pretrain $pretrain \
        -f $f
        -gpu_id $GPU 
done

        