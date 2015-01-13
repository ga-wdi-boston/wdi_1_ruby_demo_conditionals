# Shopping list. These are your available "ingredients":
# - cocoa_powder
# - cocoa_butter
# - cocounut_oil
# - sugar
# - artificial_sweetener

# In order to make chocolate, we must have cocoa_powder, a fat, and a
# sweetener. Ideally, we'd like cocoa_butter for our fat, but coconut_oil is
# acceptable. Either sugar or articial_sweetener will cut the bitterness of the
# cocoa.
def can_i_make_chocolate?(cocoa_powder, cocoa_butter, coconut_oil, sugar, artificial_sweetener)
  cocoa_powder && (cocoa_butter || coconut_oil) && (sugar || artificial_sweetener)
end
