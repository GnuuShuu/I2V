#!/bin/bash
# download_wan2.2_models.sh  –  moves all 6 files into the correct ComfyUI folders

# ──────────────────────────────────────────────────────────────
# 1. PATHS – these match the pod you are on
# ──────────────────────────────────────────────────────────────
COMFYUI_DIR="/ComfyUI"                         # <-- root-level folder
MODELS_DIR="$COMFYUI_DIR/models/diffusion_models"
LORAS_DIR="$COMFYUI_DIR/models/loras"

# ──────────────────────────────────────────────────────────────
# 2. Create folders (idempotent)
# ──────────────────────────────────────────────────────────────
echo "Creating ComfyUI model directories..."
mkdir -p "$MODELS_DIR"
mkdir -p "$LORAS_DIR"

# ──────────────────────────────────────────────────────────────
# 3. Download the 4 official files straight into the final location
# ──────────────────────────────────────────────────────────────
echo "Downloading official Wan2.2 files..."

wget -O "$MODELS_DIR/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors" \
  "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_high_noise_14B_fp8_scaled.safetensors" && \
  echo "high_noise model"

wget -O "$MODELS_DIR/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors" \
  "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/diffusion_models/wan2.2_i2v_low_noise_14B_fp8_scaled.safetensors" && \
  echo "low_noise model"

wget -O "$LORAS_DIR/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors" \
  "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_high_noise.safetensors" && \
  echo "4-step high_noise LoRA"

wget -O "$LORAS_DIR/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors" \
  "https://huggingface.co/Comfy-Org/Wan_2.2_ComfyUI_Repackaged/resolve/main/split_files/loras/wan2.2_i2v_lightx2v_4steps_lora_v1_low_noise.safetensors" && \
  echo "4-step low_noise LoRA"

# ──────────────────────────────────────────────────────────────
# 4. MOVE your two custom LoRAs (they are in the same folder as this script)
# ──────────────────────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "Moving custom LoRAs from $SCRIPT_DIR"

mv "$SCRIPT_DIR/DR34ML4Y_I2V_14B_LOW.safetensors"  "$LORAS_DIR/"  && echo "DR34ML4Y LOW moved"
mv "$SCRIPT_DIR/DR34ML4Y_I2V_14B_HIGH.safetensors" "$LORAS_DIR/" && echo "DR34ML4Y HIGH moved"

# ──────────────────────────────────────────────────────────────
# 5. Final check
# ──────────────────────────────────────────────────────────────
echo ""
echo "All 6 files are now in place:"
echo "   Diffusion models → $MODELS_DIR"
echo "   LoRAs            → $LORAS_DIR"
echo ""
echo "LoRAs available:"
ls -lh "$LORAS_DIR"/*.safetensors 2>/dev/null || echo "No LoRAs found!"
