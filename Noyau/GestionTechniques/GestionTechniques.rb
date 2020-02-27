##
# File: GestionTechniques.rb
# Project: Techniques
# File Created: Friday, 14th February 2020 5:40:31 pm
# Author: <CPietJa>Galbrun T.
# -----
# Last Modified: Saturday, 15th February 2020 4:11:55 pm
# Modified By: <CPietJa>Galbrun T.
#
path = File.expand_path(File.dirname(__FILE__))

Dir[path + "/Techniques/*"].each { |folder|
    Dir[folder+"/*"].each { |file| require file }
}
require path + "/../Constante"
require path + "/Technique"

##
# * ===Description
# Cette classe permet de gérer un ensemble de Technique avec
# un ensemble d'opérations.
#
# * ===Méthodes de classe
# [listeTechniques] Renvoie la liste des techniques.
# [description(technique)] Renvoie la description d'une
# technique donnée.
# [setDescription(technique,description)] Change la description
# d'une technique donnée.
# [chercher(technique,plateau)] Cherche dans un plateau si la
# technique est applicable
# [getZone] Voir Technique#zone
# [getLignes] Voir Technique#lignesAModif
#
# * ===Variables de classe
# [listeTechniques] Table de Hashage contenant pour chaque clé
# une instance d'une technique.
#
class GestionTechniques
    # Liste Techniques
    @@listeTechniques = {
        :T1A3LB => UnAvecTroisLB.new("T1A3LB"),
        :T2A2LB => DeuxAvecDeuxLB.new("T2A2LB"),
        :T3A1LB => TroisAvecUneLB.new("T3A1LB")
    }

    # Renvoie la liste des techniques
    def self.listeTechniques
        return @@listeTechniques.keys()
    end

    # Renvoie la description d'une technique
    def self.description (technique)
        if (techniqueValide?(technique))
            return @@listeTechniques[technique].description()
        end
        raise TechniqueError, "Technique Incorrecte"
    end

    # Change la description d'une technique
    def self.setDescription (technique, description)
        if (techniqueValide?(technique))
            return @@listeTechniques[technique].description = description
        end
        raise TechniqueError, "Technique Incorrecte"
    end

    # Cherche dans un plateau si la technique est applicable
    def self.chercher (technique,plateau)
        if (techniqueValide?(technique))
            res = @@listeTechniques[technique].chercher(plateau)
            #puts @@listeTechniques[technique].to_s()
            return res
        end
        raise TechniqueError, "Technique Incorrecte"
    end

    # Voir Technique#zone
    def self.getZone(technique)
        if (techniqueValide?(technique))
            return @@listeTechniques[technique].zone()
        end
        raise TechniqueError, "Technique Incorrecte"
    end

    # Voir Technique#lignesAModif
    def self.getLignes(technique)
        if (techniqueValide?(technique))
            return @@listeTechniques[technique].lignesAModif()
        end
        raise TechniqueError, "Technique Incorrecte"
    end

    private
    # Vérifie que la technique existe
    def self.techniqueValide? (technique)
        if(technique.class() != Symbol)
            return false
        end
        return @@listeTechniques.has_key?(technique)
    end

end

GT = GestionTechniques