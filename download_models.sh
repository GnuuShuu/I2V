#!/bin/bash
# download_wan2.2_models.sh  –  moves all 6 files into the correct ComfyUI folders

# ──────────────────────────────────────────────────────────────
# 3. Download the 4 official files straight into the final location
# ──────────────────────────────────────────────────────────────
echo "Downloading official Wan2.2 files..."

wget "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors" && \
  echo "high_noise model"

wget "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors" && \
  echo "low_noise model"

wget "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors" && \
  echo "4-step high_noise LoRA"

wget "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors" && \
  echo "4-step low_noise LoRA"




