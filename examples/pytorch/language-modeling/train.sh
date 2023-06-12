## SETTING ##
#MODEL=google/long-t5-tglobal-base
MODEL=camembert-base
LOGGING_STEPS=100
BATCH_SIZE=32 
## END OF SETTINGS ## 

moreh-smi device --switch 4

python run_clm.py \
    --model_name_or_path ${MODEL} \
    --dataset_name wikitext \
    --dataset_config_name wikitext-2-raw-v1 \
    --per_device_train_batch_size ${BATCH_SIZE} \
    --per_device_eval_batch_size ${BATCH_SIZE} \
    --do_train \
    --do_eval \
    --output_dir /tmp/test-clm