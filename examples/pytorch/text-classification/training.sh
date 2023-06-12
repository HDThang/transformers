
##    SETTINGS     ## 
MODEL=facebook/mbart-large-cc25
LOGGING_STEPS=100
## END OF SETTINGS ## 

BATCH_SIZE=64

LOG_FILE=${MODEL}`_train_log`.log
# gpu1
moreh-smi device --switch 3

export TASK_NAME=mrpc
python run_glue.py \
  --model_name_or_path ${MODEL} \
  --task_name $TASK_NAME \
  --do_train \
  --do_eval \
  --max_seq_length 128 \
  --per_device_train_batch_size ${BATCH_SIZE} \
  --learning_rate 2e-5 \
  --num_train_epochs 3 \
  --output_dir /tmp/$TASK_NAME/ \
  --overwrite_output_dir \

tmux capture-pane -pS -200 > ${LOG_FILE}_training_log.log
##python ../../../../uploadS3.py ${LOG_FILE} 
