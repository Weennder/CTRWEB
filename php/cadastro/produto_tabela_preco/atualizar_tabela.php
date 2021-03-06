<?php 
	//ATUALIZAR TABELA DE PREÇO(Cadastros -> PRODUTOS -> TABELA PREÇOS)
	//Validação
	
	error_reporting(0);

	//Sessão
	include('../../classes/session.class.php');
	$sessao = new Session();
	
		
	include('../../classes/bd_oracle.class.php'); 

	//Inclui funções
	include("../../functions.php");
	//CONTROLE DE ACESSO
	$acessar = acessaTela(158, $sessao->getNode('usuario_citrino'),'ALTERAR',$conecta);
	if(validaAcesso($acessar)){						

		if(!isset($_POST['tabela_preco']) || empty($_POST['tabela_preco'])){
			echo 'Variável tabela está vazia.';
		}else{
			if($sessao->checkNode('empresa_acessada') == FALSE){
				echo 'Erro ao localizar empresa!';
			}else{
					
				//Grava no banco
				include('../../classes/bd_oracle.class.php');
				$tabela_preco		= strip_tags($_POST['tabela_preco']);
				$indice_venda		= strip_tags($_POST['indice_venda']);
				$codigo				= strip_tags($_POST['codigo']);
				$empresa 			= $sessao->getNode('empresa_acessada');

				//SQL
				$sql = "UPDATE TABELA_PRECO
						   SET TABPREDEN = '".$tabela_preco."',
						   	   TABPREINDVEN = ".$indice_venda.", 
							   USUCOD    = ".$sessao->getNode('usuario_citrino')."
						 WHERE EMPCOD = ".$empresa."
						   AND TABPRECOD = ".$codigo;
				
				$result=oci_parse($conecta,$sql);
				
				try{
					if(oci_execute($result)){
						echo '<span class="delivery_span_email">Tabela de preço salvo com sucesso</span>';
					}else{
						$erro = oci_error($result);
						//echo '<pre>';print_r($erro);echo '</pre>';
						echo 'Falha ao Salvar';
					}
				}catch(Excpetion $e){
					echo 'Erro inesperado';
				}
			}
		}
	}else{
		echo 'Usuário não tem permissão para alterar';
	}
	?>
