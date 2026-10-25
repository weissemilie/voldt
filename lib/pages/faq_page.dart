import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:voldt/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:voldt/core/theme/app_pallete.dart';
import 'package:voldt/widgets/app_bar.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  static final List<Map<String, String>> _items = [
    {
      'q': 'Hvornår bliver løn udbetalt?',
      'a':
          'Udbetalingsplanen administreres centralt, og der kan være forskel alt efter bank, helligdage og skiftende afregningsperioder. For at få den præcise dato skal du kontakte HR, som ligger inde med den officielle kalender og kan tjekke din sag.',
    },
    {
      'q': 'Hvordan holder man pauser i voldt?',
      'a':
          'Pauseregler, hviletider og placering af pauser følger interne retningslinjer og gældende overenskomst. Da praksis kan variere afhængigt af rolle og kontrakt, skal du kontakte HR for de gældende regler for dig.',
    },
    {
      'q': 'Hvordan skifter jeg opgave?',
      'a':
          'Opgaveskift afhænger af planlægning, godkendelser og kontraktforhold. Kontakt HR for at koordinere processen og få at vide, hvad der er muligt hvornår, og hvad næste skridt er.',
    },
    {
      'q': 'Hvem kontakter jeg, hvis noget går galt?',
      'a':
          'Uanset om det drejer sig om en uregelmæssighed, et tvivlsspørgsmål eller en hændelse, er HR det officielle kontaktpunkt. De registrerer sagen, sikrer korrekt håndtering og involverer de rette afdelinger. Kort sagt: start hos HR.',
    },
    {
      'q': 'Hvordan tjener jeg flere penge?',
      'a':
          'Muligheder for højere indtjening kommer an på satser, tilgængelige opgavetyper, bonusordninger og anciennitet. Kontakt HR for at gennemgå dine muligheder og få konkret rådgivning for netop din aftale.',
    },
    {
      'q': 'Hvordan sletter jeg min konto?',
      'a':
          'Sletning af konto og tilknyttede persondata er omfattet af interne procedurer og databeskyttelsesregler. Kontakt HR for at verificere din identitet, forklare konsekvenserne og sætte gang i processen.',
    },
    {
      'q': 'Hvordan opsiger jeg min kontrakt?',
      'a':
          'Opsigelsesvarsel, formkrav og eventuelle bindinger skal overholdes, og de kan variere. Kontakt HR for at bekræfte dit varsel, sende dig den korrekte skabelon og registrere opsigelsen.',
    },
    {
      'q':
          'Hvorfor modtager jeg ikke det fulde beløb for et job?',
      'a':
          'Afregningen kan påvirkes af satser, fradrag, skat, gebyrer eller korrektioner (fx ved afvigelser i leveringen). Kontakt HR som har mulighed for at se afregningsgrundlaget og forklare din udbetaling.',
    },
    {'q': 'Hvordan kontakter jeg HR?', 'a': 'Kontakt HR.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VoldtAppBar(
        onLogout: () {
          context.read<AppUserCubit>().logOut();
          context.go('/');
        },
        showFaqButton: false,
        showBack: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        itemCount: _items.length,
        separatorBuilder:
            (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, i) {
          final it = _items[i];
          return Card(
            color: AppPallete.mediumGrey,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Theme(
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                collapsedShape:
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                tilePadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                title: Text(
                  it['q']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                childrenPadding: const EdgeInsets.fromLTRB(
                  16,
                  0,
                  16,
                  16,
                ),
                children: [
                  Text(
                    it['a']!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
