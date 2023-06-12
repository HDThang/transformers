## SETTING ##
MODEL=facebook/mbart-large-50
LOGGING_STEPS=100
BATCH_SIZE=32
## END OF SETTINGS ## 

moreh-smi device --switch 3

python run_translation.py \
    --model_name_or_path ${MODEL} \
    --do_train \
    --do_eval \
    --source_lang en \
    --target_lang ro \
    --dataset_name wmt16 \
    --dataset_config_name ro-en \
    --output_dir /tmp/mbart-large-50-translation \
    --per_device_train_batch_size=${BATCH_SIZE} \
    --per_device_eval_batch_size=${BATCH_SIZE} \
    --overwrite_output_dir \
    --predict_with_generate