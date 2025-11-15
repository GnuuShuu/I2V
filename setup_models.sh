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

# ──────────────────────────────────────────────────────────────
# 4. MOVE your two custom LoRAs (they are in the same folder as this script)
# ──────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Moving custom LoRAs from $SCRIPT_DIR"

mv "$SCRIPT_DIR/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors"  "/ComfyUI/models/diffusion_models/"  && echo "wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors moved"
mv "$SCRIPT_DIR/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors"  "/ComfyUI/models/diffusion_models/"  && echo "wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors moved"

mv "$SCRIPT_DIR/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors"  "/ComfyUI/models/loras/"  && echo "wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors moved"
mv "$SCRIPT_DIR/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors"  "/ComfyUI/models/loras/"  && echo "wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors moved"
mv "$SCRIPT_DIR/DR34ML4Y_I2V_14B_LOW.safetensors"  "/ComfyUI/models/loras/"  && echo "DR34ML4Y_I2V_14B_LOW.safetensors moved"
mv "$SCRIPT_DIR/DR34ML4Y_I2V_14B_HIGH.safetensors" "/ComfyUI/models/loras/" && echo "DR34ML4Y_I2V_14B_HIGH.safetensors moved"
mv "$SCRIPT_DIR/I2V-WAN2.2-HighNoise_POV-FaceSitting-000026.safetensors"  "/ComfyUI/models/loras/"  && echo "I2V-WAN2.2-HighNoise_POV-FaceSitting-000026.safetensors moved"
mv "$SCRIPT_DIR/wan2.2-i2v-high-sex-fov-slider-v1.0.safetensors" "/ComfyUI/models/loras/" && echo "wan2.2-i2v-high-sex-fov-slider-v1.0.safetensors moved"
mv "$SCRIPT_DIR/wan2.2-i2v-low-sex-fov-slider-v1.0.safetensors"  "/ComfyUI/models/loras/"  && echo "wan2.2-i2v-low-sex-fov-slider-v1.0.safetensors moved"
mv "$SCRIPT_DIR/wan2.2-i2v-low-sex-smashcut-v1.0.safetensors" "/ComfyUI/models/loras/" && echo "wan2.2-i2v-low-sex-smashcut-v1.0.safetensors"


