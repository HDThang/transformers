python run_semantic_segmentation.py \
    --model_name_or_path nvidia/mit-b0 \
    --dataset_name segments/sidewalk-semantic \
    --output_dir ./segformer_outputs/ \
    --overwrite_output_dir \
    --remove_unused_columns False \
    --do_train \
    --learning_rate 0.00006 \
    --lr_scheduler_type polynomial \
    --per_device_train_batch_size 64 \
    --per_device_eval_batch_size 64 \
    --logging_strategy epoch \