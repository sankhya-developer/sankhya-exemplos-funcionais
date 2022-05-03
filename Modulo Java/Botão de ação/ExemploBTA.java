package br.com.sankhya.action.botaoacao;

import java.util.ArrayList;
import java.util.List;

import br.com.sankhya.extensions.actionbutton.AcaoRotinaJava;
import br.com.sankhya.extensions.actionbutton.ContextoAcao;
import br.com.sankhya.modelcore.util.PesquisaCepHelper;
import br.com.sankhya.modelcore.util.PesquisaCepHelper.Endereco;

public class ExemploBTA implements AcaoRotinaJava {

	@Override
	public void doAction(ContextoAcao contexto) throws Exception {

		String cep = (String) contexto.getParam("CEP");

		//Tentando a busca na base local
		List<Endereco> cepsLocal = PesquisaCepHelper.obterDadosDoCepLocal(cep);

		if (cepsLocal.size() > 0) {
			contexto.setMensagemRetorno(buildResponse(cepsLocal));
			return;
		}

		List<Endereco> cepsResolved = new ArrayList<Endereco>();

		//Provedor SOAP Correios(http://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente)
		try {
			cepsResolved = PesquisaCepHelper.obterDadosDoCepCorreios(cep, false);
		} catch (Exception e) {
			contexto.setMensagemRetorno(e.getMessage());
			return;
		}

		if (cepsResolved.size() > 0) {
			contexto.setMensagemRetorno(resolveCepResponse(cepsResolved, cepsLocal, false));
			return;
		}

		//Provedor Republica Virtual(http://republicavirtual.com.br/cep/index.php)
		try {
			cepsResolved = PesquisaCepHelper.obterDadosDoCepRepublicaVirtual(cep, false);
		} catch (Exception e) {
			contexto.setMensagemRetorno(e.getMessage());
			return;
		}

		if (cepsResolved.size() > 0) {
			contexto.setMensagemRetorno(resolveCepResponse(cepsResolved, cepsLocal, false));
			return;
		}

		//Provedor ViaCep(https://viacep.com.br/)
		try {
			cepsResolved = PesquisaCepHelper.obterDadosDoCepViaCep(cep, false);
		} catch (Exception e) {
			contexto.setMensagemRetorno(e.getMessage());
			return;
		}

		if (cepsResolved.size() > 0) {
			contexto.setMensagemRetorno(resolveCepResponse(cepsResolved, cepsLocal, false));
			return;
		}
		
		contexto.setMensagemRetorno("O CEP não foi encontrado em nenhuma API conhecida ou não existe!");

	}

	private String buildResponse(List<Endereco> ceps) {
		StringBuilder ret = new StringBuilder();

		for (Endereco endereco : ceps) {

			ret.append("Endereço: \n");
			ret.append("cep: " + endereco.getCep());
			ret.append("\ncodBairro: " + endereco.getCodBairro());
			ret.append("\ncodCid: " + endereco.getCodCid());
			ret.append("\ncodEnd: " + endereco.getCodEnd());
			ret.append("\ncodUf: " + endereco.getCodUf());

			ret.append("\nDescBairro: " + endereco.getDescBairro());
			ret.append("\nDescCidade: " + endereco.getDescCid());
			ret.append("\nDescEndereço: " + endereco.getDescEnd());
			ret.append("\nDescUF: " + endereco.getDescUf());

			ret.append("\n\n");

		}

		return ret.toString();
	}

	private String resolveCepResponse(List<Endereco> cepsWebServices, List<Endereco> cepsFromLocal, Boolean insert) throws Exception {
		Endereco cepFromWebService = cepsWebServices.get(0);
		Endereco cepLocal = null;

		if (cepsFromLocal != null && cepsFromLocal.size() > 0) {
			cepLocal = cepsFromLocal.get(0);
		}

		List<Endereco> cepsResponse = new ArrayList<Endereco>();

		if (!insert && cepFromWebService != null && cepLocal != null && PesquisaCepHelper.isDescriptionsDifferent(cepFromWebService, cepLocal)) {
			cepsResponse.add(PesquisaCepHelper.updateAddress(cepLocal, cepFromWebService));
		} else if (cepsFromLocal.isEmpty()) {
			cepsResponse = cepsWebServices;
		} else {
			cepsResponse = cepsFromLocal;
		}

		return buildResponse(cepsResponse);
	}
}
