## SETTING ##
MODEL=google/pegasus-xsum
LOGGING_STEPS=100
BATCH_SIZE=16

## END OF SETTINGS ## 

moreh-smi device --switch 4

python run_summarization.py \
    --model_name_or_path ${MODEL} \
    --do_train \
    --dataset_name billsum \
    --source_prefix "summarize: " \
    --output_dir /tmp/pegasus-summarization \
    --per_device_train_batch_size=${BATCH_SIZE} \
    --overwrite_output_dir \
    --predict_with_generate