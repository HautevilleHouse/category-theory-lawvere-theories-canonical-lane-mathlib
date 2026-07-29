import canonicalLaneMathlib.AdmissibleClass
import Mathlib.CategoryTheory.Limits.Limits
import Mathlib.CategoryTheory.Yoneda

namespace HautevilleHouse
namespace CategoryTheoryLawvereTheoriesCanonicalLaneLean

open CategoryTheory

structure LawvereTheory where
  category : Type u
  [inst : Category.{v} category]
  finiteProducts : HasFiniteProducts category
  baseObject : category

def LawvereTheoryMorphism (T S : LawvereTheory) : Type _ :=
  Functor T.category S.category

structure LawvereAdmittedObject where
  theory : LawvereTheory
  model : theory.category ⥤ Type u
  preservingFiniteProducts : PreservesFiniteProducts model
  yonedaEmbedding : YonedaEmbedding theory.category
  conclusion : model ≅ yonedaEmbedding.obj theory.baseObject

end CategoryTheoryLawvereTheoriesCanonicalLaneLean
end HautevilleHouse