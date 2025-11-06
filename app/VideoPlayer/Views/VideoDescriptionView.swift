//
//  VideoDescriptionView.swift
//  VideoPlayer
//
//  Created by Matthew Musoke on 2025-11-06.
//

import SwiftUI
import Down

struct VideoDescriptionView: View {
    var title = "Title"
    var author = "Author"
    var description = "# Famemque horrescere occasus neve\n\n## Ityosque oraque subvolat patetis\n\nLorem markdownum purpura Scyrum, ira aper cruribus purpurea at neve\npraecordiaque illa de erat. Lapithae pollice; nec *aret principiis* sua preces\nregia nam? Templa cruorem sparsos **ardua** protinus *subtraheret fruge*\nexemplum, esse, toros. Ubi quibus sparsaque tutela.\n\n- Suo rogat lumina puto ut frater Lycetum\n- Illos dilecta diva\n- Quoniam Daedalus\n- Vulnere coniuge trisulcis nunc leves\n- Una veluti mea Achivi ferum pectus\n- Pressit tu Iovis mutantur sedere Credulitas ambage\n\n*Vitataque Fame cornibus* volubilitas ad nec insania petito adrectisque ipsa\nanimasque pugnabant ferrum parant. Sensit haec promissaque currus. Tauri levius\ntetigisset dixere est mora ponti, ea posuit pedem circuit: viribus, iterum, e\nseque! Temptare perpetuo ferit non telis Hippotaden milibus valuissent\n[ait](http://incensaquefaveas.com/aera), corpore volenti instruxere Anienis\namor, bis saxum?\n\n## Regemque miscuit capit amanti\n\nTalibus haustus, nec ficti: ille una lacertis praeter dixerat inputet.\n[Instabiles illam](http://cerniset.net/sacraangustis), suique [mentitus manus\nserpente](http://www.opportunacadentem.org/certum): conataque artes latos!\n\n- Alter sua\n- Amentis clamor\n- Suspirat albentibus delusa barbariam Gigantas umbras at\n- Vertit iuventus\n- Ergo conspexi aratri infausto audacia esset\n\n## Rebus in parantem dignum ruptosque collis certamine\n\nNon Creten mirabere concrescere ipse virgineos quos et mensis iunget, nullamque\nLibycas. Uterum monimenta nunc obliquo fiant **illa** ante haeremusque opesque\nOthrys, rursusque indoctum ignibus **comites Iri**. Sermonibus ripa flectant\npudibundaque ardet est medioque nobilis, heres me genetrix videritis illa. Humo\ndum ac accepit mando imagine similis, ingemuit ora omnes offensa omnia causa\nuberibus fertque aequora?\n\nFrustra fecit pan! Unum deosque membra: nova: inter sic genitor terra somni\nAeoliden quam telae. Haec gravis non facies lata mille, procorum possem scopulo,\nsibi sic maius iussa; ante caelestum ungues, opem. Ramis sanguine, si *nec\nmiseris scitatur* pereuntem comites, vult et cani cur ventorum, tuebere\ntenuaverat, multi.\n\nNeque gemitu. Quo moles ex quis certa adhaesit hanc saltu nigrae [adeundi\ncarinae](http://vultus-antiquas.io/) vobis murmure haberet ira factis? Et\n**adiere** inplevere sibi, retia."

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title)
                Spacer()
                Text(author)
                    .font(.subheadline)
                Spacer()
                Text(
                    AttributedString(
                        (try? Down(markdownString: description).toAttributedString())
                        ?? NSAttributedString(string: description)
                    )
                )
            }
            .padding()
        }
    }
}

#Preview {
    VideoDescriptionView()
}
