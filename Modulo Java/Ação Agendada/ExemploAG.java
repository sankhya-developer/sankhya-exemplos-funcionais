package br.com.sankhya.action.acaoagendada;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;

import org.cuckoo.core.ScheduledAction;
import org.cuckoo.core.ScheduledActionContext;

import com.sankhya.util.BigDecimalUtil;

import br.com.sankhya.jape.EntityFacade;
import br.com.sankhya.jape.core.JapeSession;
import br.com.sankhya.jape.core.JapeSession.SessionHandle;
import br.com.sankhya.jape.dao.JdbcWrapper;
import br.com.sankhya.jape.vo.DynamicVO;
import br.com.sankhya.jape.wrapper.JapeFactory;
import br.com.sankhya.jape.wrapper.JapeWrapper;
import br.com.sankhya.modelcore.util.DynamicEntityNames;
import br.com.sankhya.modelcore.util.EntityFacadeFactory;

public class ExemploAG implements ScheduledAction {

	private JdbcWrapper jdbc = null;

	@Override
	public void onTime(ScheduledActionContext ctx) {

		SessionHandle hnd = null;

		try {

			hnd = JapeSession.open();

			EntityFacade dwfEntityFacade = EntityFacadeFactory.getDWFFacade();
			jdbc = dwfEntityFacade.getJdbcWrapper();

			JapeWrapper instanciaDAO = JapeFactory.dao(DynamicEntityNames.PARCEIRO);
			DynamicVO registroVO = instanciaDAO.findOne("CODPARC = 1");

			String mensagem = montaEmail("Parceiro codigo: " 
					+ registroVO.asBigDecimal("CODPARC") 
					+ " - Nome: " 
					+ registroVO.asString("NOMEPARC"));

			enviarEmail("Teste Ação Agendada", mensagem, "wellyton.santos@sankhya.com.br");

			//System.out.println("EMAIL ENVIADO COM SUCESSO");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcWrapper.closeSession(jdbc);
			JapeSession.close(hnd);

		}
	}

	public static void enviarEmail(String titulo, String mensagem, String dest) throws Exception {
		SessionHandle hnd = null;
		try {
			hnd = JapeSession.open();
			JapeWrapper ordemServicoDAO = JapeFactory.dao(DynamicEntityNames.FILA_MSG);
			ordemServicoDAO.create()
			.set("EMAIL", dest.trim())
			.set("CODCON", BigDecimal.ZERO)
			.set("CODMSG", null)
			.set("STATUS", "Pendente")
			.set("TIPOENVIO", "E")
			.set("MAXTENTENVIO", BigDecimalUtil.valueOf(3))
			.set("ASSUNTO", titulo)
			.set("MENSAGEM", mensagem.toCharArray())
			.save();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JapeSession.close(hnd);
		}
	}

	public static String montaEmail(String texto) {
		String email = usingBufferedReader();
		email = email.replace("{{MENSAGEM}}", texto);

		return email;
	}

	private static String usingBufferedReader() {
		StringBuilder contentBuilder = new StringBuilder();
		InputStream is = ExemploAG.class.getResourceAsStream("email.txt");
		InputStreamReader reader = new InputStreamReader(is);

		try {
			BufferedReader br = new BufferedReader(reader);
			String sCurrentLine;
			while ((sCurrentLine = br.readLine()) != null) {
				contentBuilder.append(sCurrentLine).append("\n");
			}
		} catch (Exception e) {
		}

		return contentBuilder.toString();
	}

}
