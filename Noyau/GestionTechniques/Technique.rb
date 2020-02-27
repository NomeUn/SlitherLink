##
# File: Technique.rb
# Project: Techniques
# File Created: Friday, 14th February 2020 5:30:28 pm
# Author: <CPietJa>Galbrun T.
# -----
# Last Modified: Saturday, 15th February 2020 4:08:22 pm
# Modified By: <CPietJa>Galbrun T.
#

##
# * ===Description
# Une Technique est une classe abstraite permettant la
# recherche d'une technique dans un plateau de Case.
#
# * ===Méthodes d'instance
# [chercher] Renvoie vrai si la technique a réussi, faux
# par défaut, met à jour les variables d'instances :
# zone et lignesAModif.
#
# * ===Variables d'instance
# [description] Description de la technique.
# [zone] Zone où a réussi la technique.
# [lignesAModif] Tableau de Ligne qui peuvent être modifiées.
#
class Technique
    # Reader
    attr_reader :zone, :lignesAModif
    # Getter
    # Accessor
    attr_accessor :description

    def initialize (description)
        @description = description
        @zone = nil
        @lignesAModif = []
    end

    def to_s
        return @description
    end

    def chercher
        @zone = nil
        @lignesAModif = []
        return false
    end

    def to_s
        s = "=== Description ===\n" + @description.to_s()
        s += "\n=== Zone ===\n" + @zone.to_s()
        s += "\n=== Lignes ===\n" + @lignesAModif.to_s()
        return s
    end

    private
    # Renvoie la taille de la 2eme dimension du plateau
    def getTailleLigne (plateau)
        return plateau[0].size()
    end

    # Renvoie la taille du plateau
    def getTailleColonne (plateau)
        return plateau.size()
    end

end

class TechniqueError < RuntimeError
end