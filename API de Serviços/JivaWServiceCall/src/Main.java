import java.io.InputStream;
import java.io.StringWriter;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;

import br.com.sankhya.service.SWServiceInvoker;

/**
 * Esse exemplo depende das seguintes APIs no classPath:
 * 
 *    1 - SWService (API Sankhya para chamar Webservices)
 *    2 - Apache Commons Codec (Dependencia indireta da SWService)
 *     
 * @author gualberto
 *
 */
public class Main {
	public static void main(String[] args) {
		listarParceiros();
	}

	private static void listarParceiros() {
		try {
			SWServiceInvoker si = new SWServiceInvoker("http://192.168.1.218:8180", "SUP", "");

			StringBuffer serviceBody = loadServiceBody(Main.class, "buscaParceirosPorNome-body.xml");
			
			replaceParameters(serviceBody,"JOSE%");
			
			Document docRet = si.call("CRUDServiceProvider.loadRecords", "mge", serviceBody.toString() );

			printResponse(docRet);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Substitui os parametros contidos no XML de corpo da requisição
	 * @param body
	 * @param params  vetor com os parametros, onde @P0 será substutuido pelo primeiro elemento e assim por diante 
	 */
	private static void replaceParameters(StringBuffer body, String... params) {
		//Substitui os possíveis parametros
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++) {
				String pName = "@P" + i;
				int fromIndex = 0;
				while ((fromIndex = body.indexOf(pName, fromIndex)) > -1) {
					body.replace(fromIndex, fromIndex + pName.length(), params[i]);
				}
			}
		}
	}

	/**
	 * Carrega o corpo da requisição XML e substitui possíveis parametros
	 */
	private static StringBuffer loadServiceBody(Class baseClass, String resourcePath) throws Exception {
		InputStream inStream = baseClass.getResourceAsStream(resourcePath);

		if (inStream == null) {
			throw new IllegalArgumentException("Arquivo não encontrado: " + baseClass.getName() + " -> " + resourcePath);
		}

		byte[] buf = new byte[1024];

		StringBuffer sbuf = new StringBuffer();

		//Lê o XML para o StringBuffer
		while (true) {
			int readen = inStream.read(buf);

			if (readen <= 0) {
				break;
			}

			sbuf.append(new String(buf, 0, readen, "ISO-8859-1"));
		}

		return sbuf;
	}

	private static void printResponse(Document doc) throws Exception {
		Transformer transformer = TransformerFactory.newInstance().newTransformer();
		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		StreamResult result = new StreamResult(new StringWriter());
		DOMSource source = new DOMSource(doc);
		transformer.transform(source, result);
		String xmlString = result.getWriter().toString();
		System.out.println("----Inicio reposta >>>");
		System.out.println(xmlString);
		System.out.println("----Fim resposta <<<");
	}

}
