#!/usr/bin/env bash

model_root="backbones"
data_path="/scratch/hlwong/datasets/CUB_200_2011"
output_dir="out"
        
# base_lr = 1.0
# lr = base_lr / 256 * cfg.DATA.BATCH_SIZE
for seed in "22"; do
    python train.py \
        --config-file configs/prompt/cub.yaml \
        MODEL.TYPE "vit" \
        DATA.BATCH_SIZE "64" \
        MODEL.PROMPT.NUM_TOKENS "0" \
        MODEL.PROMPT.DEEP "False" \
        MODEL.PROMPT.DROPOUT "0.0" \
        MODEL.PROMPT.LOCATION "prepend" \
        MODEL.PROMPT.INITIATION "pretrained-prompt" \
        MODEL.PROMPT.SAVE_FOR_EACH_EPOCH "True" \
        DATA.FEATURE "sup_vitti16_imagenet21k" \
        SOLVER.BASE_LR "0.025" \
        SOLVER.WEIGHT_DECAY "0.001" \
	SOLVER.TOTAL_EPOCH "0" \
        SEED ${seed} \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" 
done

