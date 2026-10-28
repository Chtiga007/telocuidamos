$src = "C:\Users\Maranatha 2\.gemini\antigravity\brain\76939f06-90ea-400c-983b-e801c75927db"
$dst = "C:\Users\Maranatha 2\Desktop\Te Lo Cuidamos\assets"

Copy-Item "$src\pixar_hero_pets_1793216008418.jpg" -Destination "$dst\pixar_hero_pets.jpg" -Force
Copy-Item "$src\pixar_card_grooming_1793216026867.jpg" -Destination "$dst\pixar_card_grooming.jpg" -Force
Copy-Item "$src\pixar_card_nutrition_1793216049797.jpg" -Destination "$dst\pixar_card_nutrition.jpg" -Force
Copy-Item "$src\pixar_step1_search_1793216100322.jpg" -Destination "$dst\pixar_step1_search.jpg" -Force
Copy-Item "$src\pixar_step2_meet_1793216129549.jpg" -Destination "$dst\pixar_step2_meet.jpg" -Force
Copy-Item "$src\pixar_step3_celebrate_1793216159609.jpg" -Destination "$dst\pixar_step3_celebrate.jpg" -Force
Copy-Item "$src\pixar_footer_support_1793216193839.jpg" -Destination "$dst\pixar_footer_support.jpg" -Force

Get-ChildItem "$dst\pixar_*.jpg" | Select-Object Name, Length
