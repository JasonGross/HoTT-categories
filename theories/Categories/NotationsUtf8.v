Require Export Notations.

Reserved Notation "x ≅ y" (at level 70, no associativity).

Reserved Notation "i ⁻¹" (at level 3).
Reserved Notation "C ᵒᵖ" (at level 3).
Reserved Notation "C ᵒᵖ'" (at level 3).
Reserved Notation "C ᵒᵖ''" (at level 3).
Reserved Notation "C ᵒᵖ'''" (at level 3).
Reserved Notation "C ᵒᵖ'ᴸ" (at level 3).
Reserved Notation "C ᵒᵖ'ᴿ" (at level 3).

Reserved Notation "C ★^ M D" (at level 70, no associativity).
Reserved Notation "C ★^{ M } D" (at level 70, no associativity).

Reserved Notation "S ↓ T" (at level 70, no associativity).

Reserved Notation "S ⇑ T" (at level 70, no associativity).
Reserved Notation "S ⇓ T" (at level 70, no associativity).
Reserved Notation "'CAT' ⇑ D" (at level 70, no associativity).
Reserved Notation "'CAT' ⇓ D" (at level 70, no associativity).

Reserved Notation "x ⊗ y" (at level 40, left associativity).
Reserved Notation "x ⊗m y" (at level 40, left associativity).

Reserved Infix "○" (at level 40, left associativity).
Reserved Infix "∘" (at level 40, left associativity).
Reserved Infix "∘₀" (at level 40, left associativity).
Reserved Infix "∘₁" (at level 40, left associativity).
Reserved Infix "∘'" (at level 40, left associativity).
Reserved Infix "∘₀'" (at level 40, left associativity).
Reserved Infix "∘₁'" (at level 40, left associativity).

Reserved Notation "x ↪ y" (at level 99, right associativity, y at level 200).
Reserved Notation "x ↠ y" (at level 99, right associativity, y at level 200).

Reserved Notation "x ∏ y" (at level 40, left associativity).
Reserved Notation "x ∐ y" (at level 50, left associativity).
Reserved Infix "Π" (at level 40, left associativity).
Reserved Infix "⊔" (at level 50, left associativity).

Reserved Notation "∏_{ x } f" (at level 0, x at level 99).
Reserved Notation "∏_{ x : A } f" (at level 0, x at level 99).
Reserved Notation "∐_{ x } f" (at level 0, x at level 99).
Reserved Notation "∐_{ x : A } f" (at level 0, x at level 99).

(* I'm not terribly happy with this notation, but '('s don't work
   because they interfere with things like [prod]s and grouping,
   and '['s interfere with list notation in Program. *)
Reserved Notation "F ⟨ x ⟩" (at level 10, no associativity, x at level 10).
Reserved Notation "F ⟨ x , y ⟩" (at level 10, no associativity, x at level 10, y at level 10).
Reserved Notation "F ⟨ 1 ⟩" (at level 10, no associativity).
Reserved Notation "F ⟨ x , 1 ⟩" (at level 10, no associativity, x at level 10).
Reserved Notation "F ⟨ 1 , y ⟩" (at level 10, no associativity, y at level 10).
Reserved Notation "F ⟨ 1 , 1 ⟩" (at level 10, no associativity).
Reserved Notation "F ⟨ x ⟨ 1 ⟩ ⟩" (at level 10, no associativity, x at level 10).
Reserved Notation "F ⟨ x ⟨ 1 ⟩ , y ⟨ 1 ⟩ ⟩" (at level 10, no associativity, x at level 10, y at level 10).
Reserved Notation "F ⟨ x , y ⟨ 1 ⟩ ⟩" (at level 10, no associativity, x at level 10, y at level 10).
Reserved Notation "F ⟨ 1 , y ⟨ 1 ⟩ ⟩" (at level 10, no associativity, y at level 10).
Reserved Notation "F ⟨ x ⟨ 1 ⟩ , y ⟩" (at level 10, no associativity, x at level 10, y at level 10).
Reserved Notation "F ⟨ x ⟨ 1 ⟩ , 1 ⟩" (at level 10, no associativity, x at level 10).
(*
(** Default notations *)
Notation "F ⟨ 1 ⟩" := (F ⟨ ( 1 ) ⟩)%scope : scope.
Notation "F ⟨ x , 1 ⟩" := (F ⟨ x , ( 1 ) ⟩)%scope : scope.
Notation "F ⟨ 1 , y ⟩" := (F ⟨ ( 1 ) , y ⟩)%scope : scope.
Notation "F ⟨ 1 , 1 ⟩" := (F ⟨ ( 1 ) , ( 1 ) ⟩)%scope : scope.
Notation "F ⟨ x ⟨ 1 ⟩ ⟩" := (F ⟨ ( x ⟨ 1 ⟩ ) ⟩)%scope : scope.
Notation "F ⟨ x ⟨ 1 ⟩ , y ⟨ 1 ⟩ ⟩" := (F ⟨ ( x ⟨ 1 ⟩ ) , ( y ⟨ 1 ⟩ ) ⟩)%scope : scope.
Notation "F ⟨ x , y ⟨ 1 ⟩ ⟩" := (F ⟨ x , ( y ⟨ 1 ⟩ ) ⟩)%scope : scope.
Notation "F ⟨ 1 , y ⟨ 1 ⟩ ⟩" := (F ⟨ ( 1 ) , ( y ⟨ 1 ⟩ ) ⟩)%scope : scope.
Notation "F ⟨ x ⟨ 1 ⟩ , y ⟩" := (F ⟨ ( x ⟨ 1 ⟩ ) , y ⟩)%scope : scope.
Notation "F ⟨ x ⟨ 1 ⟩ , 1 ⟩" := (F ⟨ ( x ⟨ 1 ⟩ ) , ( 1 ) ⟩)%scope : scope.
*)
(*Reserved Notation "F ⟨ x , y , .. , z ⟩" (at level 10, no associativity, x at next level, y at next level, z at next level).*)
(*Reserved Notation "F ⟨ c , - ⟩" (at level 70, no associativity).
Reserved Notation "F ⟨ - , d ⟩" (at level 70, no associativity).*)
Reserved Notation "F ₀" (at level 10, no associativity).
Reserved Notation "F ₁" (at level 10, no associativity).
Reserved Notation "F ₀ x" (at level 10, no associativity).
Reserved Notation "F ₁ m" (at level 10, no associativity).

Reserved Notation "¡ x" (at level 10, no associativity).

Reserved Notation "∫ F" (at level 0).

Reserved Infix "⊣" (at level 60, right associativity).
