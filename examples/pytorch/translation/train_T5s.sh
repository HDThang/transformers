## SETTING ##
#MODEL=google/long-t5-tglobal-base
MODEL=google/byt5-small
LOGGING_STEPS=100
alias mydate="date  +'%Y-%m-%d_%H:%M:%S'"
BATCH_SIZE=64 
LOG_FILE=${MODEL}_`training_log_mydate`.log
## END OF SETTINGS ## 

moreh-smi device --switch 1

python run_translation.py \
    --model_name_or_path ${MODEL} \
    --do_train \
    --source_lang en \
    --target_lang fr \
    --source_prefix "translate English to French: " \
    --dataset_name opus_books \
    --dataset_config_name en-fr \
    --output_dir /tmp/LongT5-translation \
    --per_device_train_batch_size=${BATCH_SIZE} \
    --per_device_eval_batch_size=${BATCH_SIZE} \
    --overwrite_output_dir \
    --predict_with_generate