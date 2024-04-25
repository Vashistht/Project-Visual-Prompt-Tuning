#!/usr/bin/env bash

model_root="/afs/ece/usr/dbhegde/VPT_Proj/backbones"
data_path="/afs/ece/usr/dbhegde/VPT_Proj/vpt/src/data/datasets/CUB_200_2011"
output_dir="/scratch/dbhegde_output"
        
# base_lr = 1.0
# lr = base_lr / 256 * cfg.DATA.BATCH_SIZE
for seed in "22"; do
    python train.py \
        --config-file configs/prompt/cub.yaml \
        MODEL.TYPE "vit" \
        DATA.BATCH_SIZE "64" \
        MODEL.PROMPT.NUM_TOKENS "50" \
        MODEL.PROMPT.DEEP "True" \
        MODEL.PROMPT.DROPOUT "0.0" \
        MODEL.PROMPT.NUM_DEEP_LAYERS "3" \
        MODEL.PROMPT.SAVE_FOR_EACH_EPOCH "True" \
        DATA.FEATURE "sup_vitti16_imagenet21k" \
        SOLVER.BASE_LR "0.25" \
        SOLVER.WEIGHT_DECAY "0.001" \
	SOLVER.TOTAL_EPOCH "100" \
        SEED ${seed} \
        MODEL.MODEL_ROOT "${model_root}" \
        DATA.DATAPATH "${data_path}" \
        OUTPUT_DIR "${output_dir}/seed${seed}" 
done

