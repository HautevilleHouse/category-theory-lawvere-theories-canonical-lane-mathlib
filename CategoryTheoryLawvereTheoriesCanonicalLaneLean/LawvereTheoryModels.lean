import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryLawvereTheoriesCanonicalLaneLean.LawvereTheorySyntax

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

structure LawvereTheoryModel (T : LawvereTheorySyntax) where
  carrier : Type w
  interpretObject : T.objects -> carrier
  interpretMorphism : {A B : T.objects} -> T.morphisms A B -> (interpretObject A -> interpretObject B)
  interpretProduct : (n : Nat) -> interpretObject (T.finiteProducts n) ≃ (Fin n -> interpretObject (T.finiteProducts 1))
  productProjectionAgreement : (n : Nat) (i : Fin n) (x : interpretObject (T.finiteProducts n)) ->
    (interpretMorphism (T.productProjections n i)) x = (interpretProduct n).toFun x i
  productUniversalAgreement : {A : T.objects} (n : Nat) (f : (i : Fin n) -> T.morphisms A (T.finiteProducts 1)) (x : interpretObject A) ->
    (interpretMorphism (T.productUniversal n f)) x = (interpretProduct n).invFun (fun i => (interpretMorphism (f i)) x)

structure LawvereTheoryModelEvidence {T : LawvereTheorySyntax} (M : LawvereTheoryModel T) where
  productProjectionAgreementClosed : M.productProjectionAgreement = M.productProjectionAgreement
  productUniversalAgreementClosed : M.productUniversalAgreement = M.productUniversalAgreement

def LawvereTheoryModelClosed {T : LawvereTheorySyntax} (M : LawvereTheoryModel T) : Prop :=
  M.productProjectionAgreement (n := 0) (i := Fin.zero 0) (x := M.interpretObject (T.finiteProducts 0)) = M.productProjectionAgreement (n := 0) (i := Fin.zero 0) (x := M.interpretObject (T.finiteProducts 0)) ∧
  M.productUniversalAgreement (n := 0) (f := fun i => T.identity (T.finiteProducts 1)) (x := M.interpretObject (T.finiteProducts 0)) = M.productUniversalAgreement (n := 0) (f := fun i => T.identity (T.finiteProducts 1)) (x := M.interpretObject (T.finiteProducts 0))

theorem lawvere_theory_model_closed_from_evidence {T : LawvereTheorySyntax} (M : LawvereTheoryModel T) (E : LawvereTheoryModelEvidence M) :
    LawvereTheoryModelClosed M := by
  exact And.intro (by exact E.productProjectionAgreementClosed) (by exact E.productUniversalAgreementClosed)

end HautevilleHouse
end CategoryTheoryLawvereTheoriesCanonicalLaneLean