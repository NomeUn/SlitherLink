##
# File: DeuxAvecDeuxLB.rb
# Project: 1Case
# File Created: Friday, 14th February 2020 6:01:41 pm
# Author: <CPietJa>Galbrun T.
# -----
# Last Modified: Saturday, 15th February 2020 4:35:59 pm
# Modified By: <CPietJa>Galbrun T.
#

path = File.expand_path(File.dirname(__FILE__))

require path + "/../../Technique"

class DeuxAvecDeuxLB < Technique
    
    def initialize (description)
        super(description)
    end

    def chercher(plateau)
        super()
        tl, tc = getTailleLigne(plateau), getTailleColonne(plateau)
        
        0.upto(tl-1) do |j|
            0.upto(tc-1) do |i|
                c = plateau[i][j]
                if (c.nbLigneDevantEtrePleine == 2)
                    if(c.nbLignePleine() <= 1 && c.nbLigneBloque() == 2)
                        @zone = Zone.new(i,j,i,j)
                        @lignesAModif += c.getLigneEtat(:VIDE)
                        return true
                    end
                end
            end
        end
        return false
    end

end